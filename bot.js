// ===== ROOT RAGERS BOT + INPUT NOMOR =====

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
const admin = "6285283786794"
const adminJid = admin + "@s.whatsapp.net"

// ===== DATA FILE =====
let data = {
 harga: "50K",
 stok: "Tersedia",
 voucher: [],
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
██║  ██║╚██████╔╝██████╔╝
╚═╝  ╚═╝ ╚═════╝ ╚═════╝
`))
 console.log(chalk.green(">>> ROOT RAGERS BOT ONLINE <<<"))
 hackerScroll()
}

logo()

// ===== START BOT =====
async function startBot(){

 const { state, saveCreds } =
  await useMultiFileAuthState(`session_${botNumber}`) // folder session unik per nomor

 const { version } =
  await fetchLatestBaileysVersion()

 const sock = makeWASocket({
  auth: state,
  logger: Pino({level:"silent"}),
  version
 })

// ===== CONNECTION =====
sock.ev.on("connection.update", update=>{
 const { connection, lastDisconnect } = update

 if(connection==="open")
  console.log(chalk.green("[✓] BOT ONLINE"))

 if(connection==="close"){
  const reason =
   lastDisconnect?.error?.output?.statusCode

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

 const msg=messages[0]
 if(!msg.message || msg.key.fromMe) return

 const from=msg.key.remoteJid
 const text=
  msg.message.conversation ||
  msg.message.extendedTextMessage?.text ||
  ""

 const t=text.toLowerCase()

// ===== TRACK USER =====
data.users[from]={last:new Date().toISOString()}
fs.writeFileSync("data.json",
 JSON.stringify(data,null,2))

// ===== MENU =====
if(t==="menu"){
 await sock.sendMessage(from,{text:
`📋 MENU

• harga
• stok
• beli
• voucher
• admin
• user online

ADMIN:
• tambah harga 100K
• tambah stok Ready
• tambah voucher DISKON10`
})
}

// ===== USER MENU =====
else if(t==="harga")
 await sock.sendMessage(from,
  {text:`💰 Harga: ${data.harga}`})

else if(t==="stok")
 await sock.sendMessage(from,
  {text:`📦 Stok: ${data.stok}`})

else if(t==="voucher")
 await sock.sendMessage(from,
  {text:`🎫 ${data.voucher.join(", ")||"Tidak ada"}`})

else if(t==="admin")
 await sock.sendMessage(from,
  {text:`👤 Admin: wa.me/${admin}`})

else if(t==="user online"){
 const u=Object.keys(data.users).length
 await sock.sendMessage(from,
  {text:`🟢 User aktif: ${u}`})
}

else if(t==="beli"){
 await sock.sendMessage(from,
  {text:"🛒 Order diterima!"})

 await sock.sendMessage(adminJid,
  {text:`📢 ORDER BARU dari ${from}`})
}

// ===== ADMIN COMMAND =====
else if(from===adminJid &&
 t.startsWith("tambah harga ")){
 data.harga=
  t.replace("tambah harga ","")
 sock.sendMessage(from,
  {text:"✅ Harga diupdate"})
}

else if(from===adminJid &&
 t.startsWith("tambah stok ")){
 data.stok=
  t.replace("tambah stok ","")
 sock.sendMessage(from,
  {text:"✅ Stok diupdate"})
}

else if(from===adminJid &&
 t.startsWith("tambah voucher ")){
 let v=t.replace("tambah voucher ","")
 data.voucher.push(v)
 sock.sendMessage(from,
  {text:"✅ Voucher ditambah"})
}

else{
 await sock.sendMessage(from,
  {text:"Ketik *menu* 😊"})
}

})

}

startBot()
