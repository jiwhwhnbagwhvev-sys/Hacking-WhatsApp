// ===== ROOT RAGERS BOT PROFESSIONAL =====

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

// ===== ADMIN =====
const admin = "6285283786794"
const adminJid = admin + "@s.whatsapp.net"

// ===== DATA =====
let data = {
 menu: {
   harga: "50K",
   stok: "Tersedia",
   voucher: ["DISKON10","FREE100"],
   beli: "🛒 Order diterima!",
   admin: `wa.me/${admin}`,
   "user online": "User aktif: 0"
 }
}

if(fs.existsSync("data.json")){
 data = JSON.parse(fs.readFileSync("data.json"))
}

// ===== LOGO & ANIMASI =====
function hackerScroll(lines=15){
 const chars="01#@$%&"
 for(let i=0;i<lines;i++){
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
██╔══██╗██╔═══██╗██╔═══██╗
██████╔╝██║   ██║██║   ██║
██╔══██╗██║   ██║██║   ██║
██║  ██║╚██████╔╝╚██████╔╝
╚═╝  ╚═╝╚═════╝  ╚═════╝
`))
 console.log(chalk.green(">>> ROOT RAGERS BOT PROFESSIONAL ONLINE <<<"))
 hackerScroll()
}

logo()

// ===== START BOT =====
async function start(){

 const { state, saveCreds } =
  await useMultiFileAuthState("session_bot")

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
  qrcode.generate(qr,{small:true})
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
data.menu["user online"] = "User aktif: " + Object.keys(data.menu).length
fs.writeFileSync("data.json",JSON.stringify(data,null,2))

// ===== USER MENU =====
if(t==="menu"){
 let menuText = "📋 MENU\n\n"
 for(let key in data.menu){
  const val = data.menu[key]
  menuText += `• ${key}: ${Array.isArray(val)?val.join(", "):val}\n`
 }
 // animasi hacker scroll
 hackerScroll(5)
 await sock.sendMessage(from,{text:menuText})
}

// ===== ADMIN MENU DYNAMIC =====
else if(from===adminJid && t.startsWith("set menu ")){
 // set menu <nama>|<isi>
 const param = t.replace("set menu ","").split("|")
 if(param.length===2){
  const [name,value] = param
  // jika ada koma, buat array
  data.menu[name] = value.includes(",") ? value.split(",").map(v=>v.trim()) : value
  fs.writeFileSync("data.json",JSON.stringify(data,null,2))
  await sock.sendMessage(from,{text:`✅ Menu '${name}' diupdate!`})
 } else {
  await sock.sendMessage(from,{text:"Format salah! Gunakan: set menu <nama>|<isi> (pisahkan array pakai koma)"})
 }
}

// ===== DELETE MENU =====
else if(from===adminJid && t.startsWith("del menu ")){
 const name = t.replace("del menu ","")
 if(data.menu[name]){
  delete data.menu[name]
  fs.writeFileSync("data.json",JSON.stringify(data,null,2))
  await sock.sendMessage(from,{text:`✅ Menu '${name}' dihapus!`})
 } else {
  await sock.sendMessage(from,{text:`❌ Menu '${name}' tidak ditemukan`})
 }
}

// ===== USER PENGGUNAAN MENU =====
else if(data.menu[t]){
 const val = data.menu[t]
 await sock.sendMessage(from,{text:Array.isArray(val)?val.join(", "):val})
}

// ===== DEFAULT =====
else{
 await sock.sendMessage(from,{text:"Ketik *menu* untuk lihat menu terbaru 😊"})
}

})

}

start()
