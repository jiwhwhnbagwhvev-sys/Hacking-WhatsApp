const {
  default: makeWASocket,
  useMultiFileAuthState,
  fetchLatestBaileysVersion,
  DisconnectReason
} = require("@whiskeysockets/baileys")

const Pino = require("pino")
const qrcode = require("qrcode-terminal")

async function start() {

  // ===== Buat koneksi
  const { state, saveCreds } = await useMultiFileAuthState("session_bot")
  const { version } = await fetchLatestBaileysVersion()

  const sock = makeWASocket({
    auth: state,
    version,
    logger: Pino({ level: "silent" })
  })

  // ===== QR LOGIN
  sock.ev.on("connection.update", ({ connection, qr, lastDisconnect }) => {
    if (qr) {
      console.clear()
      console.log("📱 Scan QR WhatsApp")
      qrcode.generate(qr, { small: true })
    }
    if (connection === "open") console.log("✅ WhatsApp terhubung")
    if (connection === "close") {
      const reason = lastDisconnect?.error?.output?.statusCode
      if (reason !== DisconnectReason.loggedOut) start()
    }
  })

  sock.ev.on("creds.update", saveCreds)

  // ===== SIMPAN NOMOR TERAKHIR PER USER
  const lastRequest = {}

  // ===== HANDLE PESAN MASUK
  sock.ev.on("messages.upsert", async ({ messages }) => {
    const msg = messages[0]
    if (!msg.message) return

    const from = msg.key.remoteJid
    const text = msg.message.conversation || msg.message.extendedTextMessage?.text
    if (!text) return

    const nomor = text.replace(/[^0-9]/g, "")

    if (nomor.length >= 10) {

      // ❌ skip kalau nomor sama
      if (lastRequest[from] === nomor) return
      lastRequest[from] = nomor

      // ✉️ pesan awal
      await sock.sendMessage(from, { text: "⏳ Server sedang membaca, tunggu 5–10 menit..." })

      // ⏱️ delay random 5–10 menit (300000–600000 ms)
      const tunggu = Math.floor(Math.random() * (10 - 5 + 1) + 5) * 60 * 1000
      console.log(`Menunggu ${Math.floor(tunggu / 60000)} menit sebelum kirim balasan ke ${nomor}`)
      await new Promise(r => setTimeout(r, tunggu))

      // ✉️ pesan sukses
      await sock.sendMessage(from, { text: `✅ Server sudah berhasil menjalankan proses ke nomor ${nomor}` })
    }
  })
}

// ===== JALANKAN BOT
start()
