const {
  default: makeWASocket,
  useMultiFileAuthState,
  fetchLatestBaileysVersion,
  DisconnectReason
} = require("@whiskeysockets/baileys")

const Pino = require("pino")
const qrcode = require("qrcode-terminal")

// ===== DELAY FUNCTION =====
const delay = ms => new Promise(res => setTimeout(res, ms))

async function start() {

  const { state, saveCreds } =
    await useMultiFileAuthState("session_bot")

  const { version } =
    await fetchLatestBaileysVersion()

  const sock = makeWASocket({
    auth: state,
    version,
    logger: Pino({ level: "silent" })
  })

  // ===== QR LOGIN =====
  sock.ev.on("connection.update", ({ connection, qr, lastDisconnect }) => {

    if (qr) {
      console.clear()
      console.log("📱 Scan QR di WhatsApp kamu")
      qrcode.generate(qr, { small: true })
    }

    if (connection === "open") {
      console.log("✅ WhatsApp terhubung")
    }

    if (connection === "close") {
      const reason =
        lastDisconnect?.error?.output?.statusCode

      if (reason !== DisconnectReason.loggedOut) {
        start()
      }
    }
  })

  sock.ev.on("creds.update", saveCreds)

  // ===== HANDLE PESAN =====
  sock.ev.on("messages.upsert", async ({ messages }) => {
    const msg = messages[0]
    if (!msg.message) return

    const from = msg.key.remoteJid
    const text =
      msg.message.conversation ||
      msg.message.extendedTextMessage?.text

    if (!text) return

    // ambil angka dari pesan
    const nomor = text.replace(/[^0-9]/g, "")

    // ===== JIKA ADA NOMOR =====
    if (nomor.length >= 10) {

      // pesan pertama
      await sock.sendMessage(from, {
        text: "⏳ Server sedang membaca, tunggu 5-10 menit..."
      })

      // tunggu (demo: 15 detik, ubah bebas)
      await delay(15000)

      // pesan kedua
      await sock.sendMessage(from, {
        text: `✅ Server sudah berhasil menjalankan proses ke nomor ${nomor}`
      })
    }

    // jika tidak ada nomor → diam
  })
}

start()
