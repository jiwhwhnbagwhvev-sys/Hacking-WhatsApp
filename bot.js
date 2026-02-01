// ===== ROOT RAGERS ULTIMATE BOT =====

const {
  default: makeWASocket,
  useMultiFileAuthState,
  DisconnectReason,
  fetchLatestBaileysVersion
} = require("@whiskeysockets/baileys")

const Pino = require("pino")
const chalk = require("chalk")
const fs = require("fs")
const qrcode = require("qrcode-terminal")
const readline = require("readline-sync")

// ===== INPUT NOMOR BOT =====
const botNumber = readline.question("Nomor Bot (62xxx): ")
console.log(chalk.green("[✓] Bot akan berjalan dengan nomor:"), botNumber)

// ===== ADMIN NUMBER =====
const admin = "6285283786794"
const adminJid = admin + "@s.whatsapp.net"

// ===== DATA =====
let data = { harga:"50K", stok:"Tersedia", voucher:[], users:{} }

if(fs.existsSync("data.json")){
 data = JSON.parse(fs.readFileSync("data.json"))
}

// ===== ANIMASI HACKER =====
function hackerScroll(lines=15){
 const chars="01#@$%&"
 for(let i=0;i<lines;i++){
  let line=""
  for(let j=0;j<60;j++)
   line+=chars[Math.floor(Math.random()*chars.length)]
  console.log(chalk.green(line))
 }
}

// ===== LOGO =====
function logo(){
 console.clear()
 console.log(chalk.red(`
██████╗  ██████╗ ██████╗
██╔══██╗██╔═══██╗██╔═══██╗
██████╔╝██║   ██║██║   ██║
██╔══██╗██║   ██║██║   ██║
██║  ██║╚██████╔╝╚██████╔╝
╚═╝  ╚═╝╚═════╝  ╚═════╝
`))
 console.log(chalk.green(">>> ROOT RAGERS BOT ONLINE <<<"))
 hackerScroll()
}

logo()

// ===== START BOT =====
async function start(){

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
 const { connection, qr, lastDisconnect } = update

 if(qr){
  console.log("\nScan QR di WhatsApp:\n")
  qrcode.generate(qr, { small:true })
 }

 if(connection==="open"){
  console.log(chalk.green("✅ BOT ONLINE\n"))
 }

 if(connection==="close"){
  console.log(chalk.red("⚠ BOT TERPUTUS, reconnecting..."))
  start()
 }
})

sock.ev.on("creds.update", saveCreds)

// ===== MESSAGE HANDLER =====
sock.ev.on("messages.upsert", async ({messages})=>{

 const msg = messages[0]
 if(!msg.message || msg.key.fromMe) return

 const from = msg.key.remoteJid
 const text =
  msg.message.conversation ||
  msg.message.extendedTextMessage?.text ||
  ""

 const t = text.toLowerCase()

// ===== TRACK USER ONLINE =====
data.users[from] = new Date().toISOString()
fs.writeFileSync("data.json", JSON.stringify(data,null,2))

// ===== MENU =====
if(t==="menu"){
 await sock.sendMessage(from,{text:
`📋 MENU

• harga
• stok
• voucher
• beli
• admin
• user online

ADMIN:
• set harga <harga>
• set stok <stok>
• add voucher <kode>`})
}

// ===== USER MENU =====
else if(t==="harga")
 await sock.sendMessage(from,{text:`💰 Harga: ${data.harga}`})

else if(t==="stok")
 await sock.sendMessage(from,{text:`📦 Stok: ${data.stok}`})

else if(t==="voucher")
 await sock.sendMessage(from,{text:`🎫 ${data.voucher.join(", ") || "Tidak ada"}`})

else if(t==="beli"){
 await sock.sendMessage(from,{text:"🛒 Order diterima!"})
 await sock.sendMessage(adminJid,{text:`📢 ORDER BARU dari ${from}`})
}

else if(t==="admin")
 await sock.sendMessage(from,{text:`👤 Admin: wa.me/${admin}`})

else if(t==="user online"){
 const u = Object.keys(data.users).length
 await sock.sendMessage(from,{text:`🟢 User aktif: ${u}`})
}

// ===== ADMIN COMMAND =====
else if(from===adminJid && t.startsWith("set harga ")){
 data.harga = t.replace("set harga ","")
 fs.writeFileSync("data.json",JSON.stringify(data,null,2))
 await sock.sendMessage(from,{text:"✅ Harga diupdate"})
}

else if(from===adminJid && t.startsWith("set stok ")){
 data.stok = t.replace("set stok ","")
 fs.writeFileSync("data.json",JSON.stringify(data,null,2))
 await sock.sendMessage(from,{text:"✅ Stok diupdate"})
}

else if(from===adminJid && t.startsWith("add voucher ")){
 let v = t.replace("add voucher ","")
 data.voucher.push(v)
 fs.writeFileSync("data.json",JSON.stringify(data,null,2))
 await sock.sendMessage(from,{text:"✅ Voucher ditambah"})
}

else{
 await sock.sendMessage(from,{text:"Ketik *menu* 😊"})
}

})

}

start()
