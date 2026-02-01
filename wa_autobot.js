const {
  default: makeWASocket,
  useMultiFileAuthState,
  DisconnectReason,
} = require("@whiskeysockets/baileys")
const P = require("pino")
const readline = require("readline-sync")
const fs = require("fs")
const chalk = require("chalk")

// ====== UTIL ======
function slowPrint(t, d = 0.02) {
  for (const c of t) {
    process.stdout.write(c)
    require("child_process").execSync("sleep " + d)
  }
  console.log()
}

function logo() {
  console.clear()
  console.log(chalk.greenBright(`
██████╗ ██████╗ ██████╗
██╔══██╗██╔═══██╗██╔═══██╗
██████╔╝██║   ██║██║   ██║
██╔═══╝ ██║   ██║██║   ██║
██║     ╚██████╔╝╚██████╔╝
╚═╝      ╚═════╝  ╚═════╝
`))
  console.log(chalk.red(">>> PUBLIC GAME & STORE WA BOT <<<"))
  slowPrint("Starting bot...", 0.01)
}

// ====== BOT ======
async function startBot() {
  logo()

  // Auth session
  const { state, saveCreds } = await useMultiFileAuthState("session")

  const sock = makeWASocket({
    auth: state,
    printQRInTerminal: true,
    logger: P({ level: "silent" }),
  })

  console.log(chalk.cyan("[INFO] BOT CONNECTING..."))

  // ====== Input nomor pelanggan ======
  let targets = []
  const multi = readline.question("Masukkan nomor pelanggan (pisah koma, contoh 6281234567890,628987654321): ")
  targets = multi.split(",").map(n => n.trim() + "@s.whatsapp.net")

  // ====== PESAN MASUK ======
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

    // Log pesan
    fs.appendFileSync("log.txt", `${new Date().toLocaleString()} | ${from}: ${text}\n`)

    // ====== AUTO REPLY ======
    if (t.includes("menu")) {
      await sock.sendMessage(from, {
        text:
`📋 *MENU TOKO*

1️⃣ ketik *harga*
2️⃣ ketik *stok*
3️⃣ ketik *beli*
4️⃣ ketik *admin*`
      })
    } else if (t.includes("harga")) {
      await sock.sendMessage(from, { text: "💰 Harga produk mulai 50K ya kak 😊" })
    } else if (t.includes("stok")) {
      await sock.sendMessage(from, { text: "📦 Stok masih tersedia 👍" })
    } else if (t.includes("beli")) {
      await sock.sendMessage(from, {
        text:
`🛒 *Cara Order*
Kirim:
• Nama produk
• Alamat
• Metode bayar
Admin akan memproses ya 🙏`
      })

      // ====== Kirim notifikasi ke semua target ======
      for (const targe of targets) {
        await sock.sendMessage(targe, { text: `💬 Ada order baru dari ${from}` })
      }

    } else if (t.includes("admin")) {
      await sock.sendMessage(from, { text: "👨‍💼 Admin: wa.me/6285283786794" })
    } else {
      await sock.sendMessage(from, {
        text:
`Halo 👋
Selamat datang di toko kami.
Ketik *menu* untuk melihat daftar.`
      })
    }
  })

  // ====== CONNECTION UPDATE ======
  sock.ev.on("connection.update", (update) => {
    const { connection, lastDisconnect } = update
    if (connection === "open") console.log(chalk.green("[INFO] BOT ONLINE ✅"))
    if (connection === "close") {
      const shouldReconnect = lastDisconnect?.error?.output?.statusCode !== DisconnectReason.loggedOut
      console.log(chalk.red("[INFO] Koneksi terputus ❌"))
      if (shouldReconnect) {
        console.log(chalk.yellow("[INFO] Reconnecting... 🔄"))
        startBot()
      }
    }
  })

  sock.ev.on("creds.update", saveCreds)
}

// ====== RUN BOT ======
startBot()
