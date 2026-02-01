 const {
  default: makeWASocket,
  useMultiFileAuthState,
  fetchLatestBaileysVersion,
  downloadMediaMessage
} = require("@whiskeysockets/baileys")

const fs = require("fs")
const readline = require("readline")

// ===== INPUT TERMINAL =====
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
})

// ===== START =====
async function start() {

  const { state, saveCreds } = await useMultiFileAuthState("view-session")
  const { version } = await fetchLatestBaileysVersion()

  const sock = makeWASocket({
    auth: state,
    version,
    printQRInTerminal: true
  })

  sock.ev.on("creds.update", saveCreds)

  sock.ev.on("connection.update", (u) => {
    if (u.connection === "open") {
      console.log("\n✅ WhatsApp Terhubung\n")
    }
  })

  // ===== MESSAGE VIEWER =====
  sock.ev.on("messages.upsert", async ({ messages }) => {

    const m = messages[0]
    if (!m.message || m.key.fromMe) return

    const from = m.key.remoteJid

    console.log("\n====================")
    console.log("📩 Dari:", from)

    // ===== TEXT =====
    let text =
      m.message.conversation ||
      m.message.extendedTextMessage?.text

    if (text) {
      console.log("💬 Pesan:", text)
    }

    // ===== IMAGE =====
    if (m.message.imageMessage) {
      console.log("🖼️ Gambar diterima")

      const buffer = await downloadMediaMessage(
        m,
        "buffer",
        {},
        { }
      )

      const file = `img_${Date.now()}.jpg`
      fs.writeFileSync(file, buffer)
      console.log("📁 Disimpan:", file)
    }

    // ===== LOCATION =====
    if (m.message.locationMessage) {
      const loc = m.message.locationMessage
      console.log("📍 Lokasi:")
      console.log("Latitude:", loc.degreesLatitude)
      console.log("Longitude:", loc.degreesLongitude)
    }

    // ===== REPLY =====
    rl.question("Balas (enter = skip): ", async (jawab) => {
      if (jawab) {
        await sock.sendMessage(from, { text: jawab })
        console.log("✅ Terkirim")
      }
    })

  })
}

start()
