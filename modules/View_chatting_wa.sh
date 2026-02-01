const {
  default: makeWASocket,
  useMultiFileAuthState,
  fetchLatestBaileysVersion,
  DisconnectReason
} = require("@whiskeysockets/baileys")

const Pino = require("pino")
const qrcode = require("qrcode-terminal")
const chalk = require("chalk")
const readline = require("readline")

// ===== LOGO =====
console.clear()
console.log(chalk.green(`
██╗   ██╗██╗███████╗██╗    ██╗    ██╗    ██╗ █████╗ 
██║   ██║██║██╔════╝██║    ██║    ██║    ██║██╔══██╗
██║   ██║██║█████╗  ██║ █╗ ██║    ██║ █╗ ██║███████║
╚██╗ ██╔╝██║██╔══╝  ██║███╗██║    ██║███╗██║██╔══██║
 ╚████╔╝ ██║███████╗╚███╔███╔╝    ╚███╔███╔╝██║  ██║
  ╚═══╝  ╚═╝╚══════╝ ╚══╝╚══╝      ╚══╝╚══╝ ╚═╝  ╚═╝
`))
console.log(chalk.yellow(">>> VIEW WHATSAPP TERMUX <<<"))
console.log()

// ===== INPUT TERMINAL =====
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
})

async function start() {

  const { state, saveCreds } =
    await useMultiFileAuthState("session")

  const { version } =
    await fetchLatestBaileysVersion()

  const sock = makeWASocket({
    version,
    auth: state,
    logger: Pino({ level: "silent" })
  })

  // ===== QR =====
  sock.ev.on("connection.update", (update) => {
    const { connection, qr, lastDisconnect } = update

    if (qr) {
      console.log(chalk.cyan("\nScan QR ini di WhatsApp:\n"))
      qrcode.generate(qr, { small: true })
    }

    if (connection === "open") {
      console.log(chalk.green("\n[✓] TERHUBUNG KE WHATSAPP\n"))
    }

    if (connection === "close") {
      if (lastDisconnect?.error?.output?.statusCode !== DisconnectReason.loggedOut) {
        console.log("Reconnect...")
        start()
      } else {
        console.log("Logout, scan ulang QR.")
      }
    }
  })

  sock.ev.on("creds.update", saveCreds)

  // ===== TAMPILKAN CHAT MASUK =====
  sock.ev.on("messages.upsert", async ({ messages }) => {
    const msg = messages[0]
    if (!msg.message) return

    const from = msg.key.remoteJid
    const text =
      msg.message.conversation ||
      msg.message.extendedTextMessage?.text ||
      ""

    console.log(chalk.yellow("\n======================"))
    console.log(chalk.green("DARI:"), from)
    console.log(chalk.white("PESAN:"), text)
    console.log(chalk.yellow("======================"))

    // ===== BALAS MANUAL =====
    rl.question("Balas (kosong = skip): ", async (jawab) => {
      if (jawab) {
        await sock.sendMessage(from, { text: jawab })
        console.log(chalk.green("✓ Terkirim"))
      }
    })
  })
}

start()
