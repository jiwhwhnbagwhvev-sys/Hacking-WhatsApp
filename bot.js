// ===== ROOT RAGERS BOT + INPUT NOMOR & PERINTAH =====

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

// ===== INPUT NOMOR BOT =====
const botNumber = readline.question("Nomor Bot (62xxx): ")
console.log(chalk.green("[✓] Bot akan berjalan dengan nomor:"), botNumber)

// ===== ADMIN =====
const admin = readline.question("Nomor Admin (62xxx): ")
const adminJid = admin + "@s.whatsapp.net"

// ===== DATA =====
let data = {
  harga: "50K",
  stok: "Tersedia",
  voucher: ["DISKON10","FREE100"],
  promo: [],
  users: {}
}

// Load data dari file jika ada
if(fs.existsSync("data.json")){
  data = JSON.parse(fs.readFileSync("data.json"))
}

// ===== ANIMASI =====
function hackerScroll(){
  const chars = "01#@$%&"
  for(let i=0;i<15;i++){
    let line=""
    for(let j=0;j<60;j++)
      line += chars[Math.floor(Math.random()*chars.length)]
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
██║  ██║╚██████╔╝██████╔╝
╚═╝  ╚═╝╚═════╝ ╚═════╝
`))
  console.log(chalk.green(">>> ROOT RAGERS BOT ONLINE <<<"))
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
    if(connection==="open")
      console.log(chalk.green("[✓] BOT ONLINE"))
    if(connection==="close"){
      const reason = lastDisconnect?.error?.output?.statusCode
      if(reason!==DisconnectReason.loggedOut){
        console.log(chalk.red("[!] Terputus, reconnecting..."))
        startBot()
      } else {
        console.log(chalk.red("[!] Session habis, login ulang"))
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

    // Track user aktif
    data.users[from] = { last:new Date().toISOString() }
    fs.writeFileSync("data.json", JSON.stringify(data,null,2))

    // ===== USER MENU =====
    if(t==="menu"){
      let menuText = `📋 MENU\n\n• harga: ${data.harga}\n• stok: ${data.stok}\n• voucher: ${data.voucher.join(", ") || "Tidak ada"}\n• beli: 🛒 Order diterima!\n• admin: wa.me/${admin}\n• user online: User aktif: ${Object.keys(data.users).length}`
      if(data.promo.length>0) menuText += `\n• promo: ${data.promo.join(", ")}`
      await sock.sendMessage(from,{text:menuText})
    }
    else if(t==="harga") await sock.sendMessage(from,{text:`💰 Harga: ${data.harga}`})
    else if(t==="stok") await sock.sendMessage(from,{text:`📦 Stok: ${data.stok}`})
    else if(t==="voucher") await sock.sendMessage(from,{text:`🎫 ${data.voucher.join(", ") || "Tidak ada"}`})
    else if(t==="promo") await sock.sendMessage(from,{text:`🔥 Promo: ${data.promo.join(", ") || "Tidak ada"}`})
    else if(t==="beli"){
      await sock.sendMessage(from,{text:"🛒 Order diterima!"})
      await sock.sendMessage(adminJid,{text:`📢 ORDER BARU dari ${from}`})
    }
    else if(t==="user online") await sock.sendMessage(from,{text:`🟢 User aktif: ${Object.keys(data.users).length}`})
    else if(t==="admin") await sock.sendMessage(from,{text:`👤 Admin: wa.me/${admin}`})

    // ===== ADMIN COMMAND =====
    else if(from===adminJid){
      if(t.startsWith("set menu promo|")){
        let items = t.replace("set menu promo|","").split(",")
        data.promo = items
        fs.writeFileSync("data.json", JSON.stringify(data,null,2))
        await sock.sendMessage(from,{text:"✅ Menu promo diupdate!"})
      }
      else if(t.startsWith("set harga ")){
        data.harga = t.replace("set harga ","")
        fs.writeFileSync("data.json", JSON.stringify(data,null,2))
        await sock.sendMessage(from,{text:"✅ Harga diupdate!"})
      }
      else if(t.startsWith("set stok ")){
        data.stok = t.replace("set stok ","")
        fs.writeFileSync("data.json", JSON.stringify(data,null,2))
        await sock.sendMessage(from,{text:"✅ Stok diupdate!"})
      }
      else if(t.startsWith("set voucher|")){
        let items = t.replace("set voucher|","").split(",")
        data.voucher = items
        fs.writeFileSync("data.json", JSON.stringify(data,null,2))
        await sock.sendMessage(from,{text:"✅ Voucher diupdate!"})
      }
    }

    else{
      await sock.sendMessage(from,{text:"Ketik *menu* untuk melihat menu 😊"})
    }
  })
}

startBot()
