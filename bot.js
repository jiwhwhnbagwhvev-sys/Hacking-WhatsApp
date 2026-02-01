// ===== ROOT RAGERS STABLE WA BOT =====

const {
  default: makeWASocket,
  useMultiFileAuthState,
  DisconnectReason,
  fetchLatestBaileysVersion
} = require("@whiskeysockets/baileys")

const P = require("pino")
const readline = require("readline-sync")
const chalk = require("chalk")

console.clear()

console.log(chalk.green(`
██████╗  ██████╗  ██████╗
██╔══██╗██╔═══██╗██╔═══██╗
██████╔╝██║   ██║██║   ██║
██╔══██╗██║   ██║██║   ██║
██║  ██║╚██████╔╝╚██████╔╝
╚═╝  ╚═╝ ╚═════╝  ╚═════╝
`))

console.log(chalk.red(">>> ROOT RAGERS WA BOT STABLE <<<\n"))

// ===== INPUT NOMOR =====
const target = readline.question("Nomor tujuan (62xxx): ")
const targetJid = target + "@s.whatsapp.net"

async function startBot() {

  const { state, saveCreds } =
    await useMultiFileAuthState("session")

  const { version } =
    await fetchLatestBaileysVersion()

  const sock = makeWASocket({
    auth: state,
    printQRInTerminal: true,
    logger: P({ level: "silent" }),
    version
  })

  // ===== KONEKSI =====
  sock.ev.on("connection.update", (update) => {
    const { connection, lastDisconnect } = update

    if (connection === "open") {
      console.log(chalk.green("\n✅ BOT ONLINE & TERHUBUNG\n"))
    }

    if (connection === "close") {
      const shouldReconnect =
        lastDisconnect?.error?.output?.statusCode !==
        DisconnectReason.loggedOut

      console.log(chalk.red("❌ Koneksi terputus"))

      if (shouldReconnect) {
        console.log("🔄 Reconnecting...")
        startBot()
      }
    }
  })

  sock.ev.on("creds.update", saveCreds)

  // ===== PESAN MASUK =====
  sock.ev.on("messages.upsert", async ({ messages }) => {

    const msg = messages[0]
    if (!msg.message) return
    if (msg.key.fromMe) return

    const from = msg.key.remoteJid

    const text =
      msg.message.conversation ||
      msg.message.extendedTextMessage?.text ||
      ""

    const t = text.toLowerCase()

    console.log("Chat:", t)

    // ===== AUTO REPLY =====
    if (t === "menu") {
      await sock.sendMessage(from, {
        text:
`📋 MENU

• harga
• stok
• beli
• admin`
      })
    }

    else if (t === "harga") {
      await sock.sendMessage(from, {
        text: "💰 Harga mulai 50K"
      })
    }

    else if (t === "stok") {
      await sock.sendMessage(from, {
        text: "📦 Stok tersedia"
      })
    }

    else if (t === "beli") {

      await sock.sendMessage(from, {
        text: "🛒 Order diterima, admin segera proses."
      })

      // Notif ke nomor kamu
      await sock.sendMessage(targetJid, {
        text: `📢 ORDER BARU dari ${from}`
      })
    }

    else if (t === "admin") {
      await sock.sendMessage(from, {
        text: "👤 Admin: wa.me/6285283786794"
      })
    }

    else {
      await sock.sendMessage(from, {
        text: "Ketik *menu* ya 😊"
      })
    }

  })

}

startBot()
