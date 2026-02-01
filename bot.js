         // ===== ROOT RAGERS BOT + AUTO REPLY + OPTIONAL QR =====

const {
  default: makeWASocket,
  useMultiFileAuthState,
  DisconnectReason,
  fetchLatestBaileysVersion
} = require("@whiskeysockets/baileys")

const Pino = require("pino")
const chalk = require("chalk")
const fs = require("fs")
const readline = require("readline-sync")
const qrcode = require("qrcode-terminal")

// ===== OpenAI setup =====
const { Configuration, OpenAIApi } = require("openai")
const configuration = new Configuration({ apiKey: process.env.OPENAI_API_KEY })
const openai = new OpenAIApi(configuration)

// ===== INPUT NOMOR BOT =====
const botNumber = readline.question("Nomor Bot (62xxx): ")
console.log(chalk.green("[✓] Bot akan berjalan dengan nomor:"), botNumber)

// ===== ADMIN =====
const admin = readline.question("Nomor Admin (62xxx): ")
const adminJid = admin + "@s.whatsapp.net"

// ===== DATA FILE =====
let data = {
  harga: "50K",
  stok: "Tersedia",
  voucher: [],
  promo: [],
  users: {}
}
if(fs.existsSync("data.json")){
  data = JSON.parse(fs.readFileSync("data.json"))
}

// ===== ANIMASI =====
function hackerScroll(){
  const chars="01#@$%&"
  for(let i=0;i<15;i++){
    let line=""
    for(let j=0;j<60;j++)
      line+=chars[Math.floor(Math.random()*chars.length)]
    console.log(chalk.green(line))
  }
}

function logo(){
  console.clear()
  console.log(chalk.red(`
██████╗  ██████╗ ██████╗ 
██╔══██╗██╔═══██╗██╔══██╗
██████╔╝██║   ██║██║   ██║
██╔══██╗██║   ██║██║   ██║
██║  ██║╚██████╔╝╚██████╔╝
╚═╝  ╚═╝╚═════╝╚═════╝
`))
  console.log(chalk.green(">>> ROOT RAGERS BOT READY <<<"))
  hackerScroll()
}

logo()

// ===== START BOT =====
async function startBot(){

  const { state, saveCreds } =
    await useMultiFileAuthState(`session_${botNumber}`)

  const { version } =
    await fetchLatestBaileysVersion()

  const sock = makeWASocket({
    auth: state,
    logger: Pino({level:"silent"}),
    version
  })

  // ===== CONNECTION =====
  sock.ev.on("connection.update", update=>{
    const { connection, lastDisconnect, qr } = update

    if(qr){
      console.log(chalk.yellow("[📌] Scan QR berikut di WhatsApp:"))
      qrcode.generate(qr,{small:true}) // QR muncul di terminal
    }

    if(connection==="open") console.log(chalk.green("[✓] BOT ONLINE"))
    if(connection==="close"){
      const reason = lastDisconnect?.error?.output?.statusCode
      if(reason!==DisconnectReason.loggedOut){
        console.log("Reconnect...")
        startBot()
      } else {
        console.log("Session habis, login ulang")
      }
    }
  })

  sock.ev.on("creds.update", saveCreds)

  // ===== MESSAGE HANDLER =====
  sock.ev.on("messages.upsert", async ({messages})=>{
    const msg = messages[0]
    if(!msg.message || msg.key.fromMe) return
    const from = msg.key.remoteJid
    const text = msg.message.conversation || msg.message.extendedTextMessage?.text || ""
    const t = text.toLowerCase()

    // ===== TRACK USER =====
    data.users[from] = { last: new Date().toISOString() }
    fs.writeFileSync("data.json", JSON.stringify(data,null,2))

    // ===== USER MENU =====
    if(t==="menu"){
      await sock.sendMessage(from,{text:
`📋 MENU
• harga: ${data.harga}
• stok: ${data.stok}
• voucher: ${data.voucher.join(", ") || "Tidak ada"}
• promo: ${data.promo.join(", ") || "Tidak ada"}
• beli: Order sekarang
• admin: wa.me/${admin}
• user online: ${Object.keys(data.users).length}`
      })
    }

    else if(t==="harga")
      await sock.sendMessage(from,{text:`💰 Harga: ${data.harga}`})

    else if(t==="stok")
      await sock.sendMessage(from,{text:`📦 Stok: ${data.stok}`})

    else if(t==="voucher")
      await sock.sendMessage(from,{text:`🎫 ${data.voucher.join(", ") || "Tidak ada"}`})

    else if(t==="promo")
      await sock.sendMessage(from,{text:`🔥 Promo: ${data.promo.join(", ") || "Tidak ada"}`})

    else if(t==="admin")
      await sock.sendMessage(from,{text:`👤 Admin: wa.me/${admin}`})

    else if(t==="user online")
      await sock.sendMessage(from,{text:`🟢 User aktif: ${Object.keys(data.users).length}`})

    else if(t==="beli"){
      await sock.sendMessage(from,{text:"🛒 Order diterima!"})
      await sock.sendMessage(adminJid,{text:`📢 ORDER BARU dari ${from}`})
    }

    // ===== ADMIN COMMAND =====
    else if(from===adminJid && t.startsWith("tambah harga ")){
      data.harga = t.replace("tambah harga ","")
      fs.writeFileSync("data.json", JSON.stringify(data,null,2))
      await sock.sendMessage(from,{text:"✅ Harga diupdate"})
    }

    else if(from===adminJid && t.startsWith("tambah stok ")){
      data.stok = t.replace("tambah stok ","")
      fs.writeFileSync("data.json", JSON.stringify(data,null,2))
      await sock.sendMessage(from,{text:"✅ Stok diupdate"})
    }

    else if(from===adminJid && t.startsWith("tambah voucher ")){
      let v = t.replace("tambah voucher ","")
      data.voucher.push(v)
      fs.writeFileSync("data.json", JSON.stringify(data,null,2))
      await sock.sendMessage(from,{text:`✅ Voucher "${v}" berhasil ditambahkan!`})
    }

    else if(from===adminJid && t.startsWith("tambah promo ")){
      let p = t.replace("tambah promo ","")
      data.promo.push(p)
      fs.writeFileSync("data.json", JSON.stringify(data,null,2))
      await sock.sendMessage(from,{text:`✅ Promo "${p}" berhasil ditambahkan!`})
    }

    // ===== AI REPLY UNTUK CHAT TIDAK DIKENALI =====
    else {
      try {
        const response = await openai.createChatCompletion({
          model: "gpt-3.5-turbo",
          messages: [{ role: "user", content: text }]
        })
        const aiReply = response.data.choices[0].message.content
        await sock.sendMessage(from, { text: aiReply })
      } catch (err) {
        console.error("Error AI:", err)
        await sock.sendMessage(from, { text: "Maaf, saya tidak mengerti 😅" })
      }
    }
  })
}

startBot()
