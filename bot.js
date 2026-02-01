// ===== ROOT RAGERS BOT v3 =====
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

// ===== INPUT NOMOR BOT & ADMIN =====
const botNumber = readline.question("Nomor BOT (62xxx): ")
const admin = readline.question("Nomor Admin (62xxx): ")
const adminJid = admin + "@s.whatsapp.net"

console.log(chalk.green("[✓] BOT akan berjalan dengan nomor:"), botNumber)
console.log(chalk.green("[✓] Admin ditetapkan ke nomor:"), admin)

// ===== DATA FILE =====
let data = {
  harga: "50K",
  stok: "Tersedia",
  voucher: ["DISKON10", "FREE100"],
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
╚═╝  ╚═╝╚═════╝ ╚═════╝
`))
  console.log(chalk.green(">>> ROOT RAGERS BOT ONLINE <<<"))
  hackerScroll()
}

logo()

// ===== START BOT =====
async function startBot(){

  const { state, saveCreds } = await useMultiFileAuthState(`session_${botNumber}`) // unik per nomor bot
  const { version } = await fetchLatestBaileysVersion()

  const sock = makeWASocket({
    auth: state,
    logger: Pino({level:"silent"}),
    version
  })

  // ===== CONNECTION =====
  sock.ev.on("connection.update", update=>{
    const { connection, lastDisconnect, qr } = update

    if(qr){
      console.log(chalk.yellow("[📌] Scan QR WhatsApp untuk nomor BOT:"), qr)
    }

    if(connection==="open"){
      console.log(chalk.green("[✓] BOT ONLINE & TERHUBUNG"))
    }

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

    // ===== TRACK USER =====
    data.users[from] = { last:new Date().toISOString() }
    fs.writeFileSync("data.json", JSON.stringify(data,null,2))

    // ===== USER MENU =====
    if(t==="menu"){
      await sock.sendMessage(from,{text:
`📋 MENU

• harga: ${data.harga}
• stok: ${data.stok}
• voucher: ${data.voucher.join(", ") || "Tidak ada"}
• beli: 🛒 Order diterima!
• admin: wa.me/${admin}
• user online: ${Object.keys(data.users).length}

ADMIN COMMAND:
• tambah harga 100K
• tambah stok Ready
• tambah voucher DISKON10`
      })
    }

    else if(t==="harga"){
      await sock.sendMessage(from,{text:`💰 Harga: ${data.harga}`})
    }

    else if(t==="stok"){
      await sock.sendMessage(from,{text:`📦 Stok: ${data.stok}`})
    }

    else if(t==="voucher"){
      await sock.sendMessage(from,{text:`🎫 ${data.voucher.join(", ")||"Tidak ada"}`})
    }

    else if(t==="beli"){
      await sock.sendMessage(from,{text:"🛒 Order diterima!"})
      if(from!==adminJid){
        await sock.sendMessage(adminJid,{text:`📢 ORDER BARU dari ${from}`})
      }
    }

    else if(t==="admin"){
      await sock.sendMessage(from,{text:`👤 Admin: wa.me/${admin}`})
    }

    else if(t==="user online"){
      await sock.sendMessage(from,{text:`🟢 User aktif: ${Object.keys(data.users).length}`})
    }

    // ===== ADMIN COMMAND =====
    else if(from===adminJid && t.startsWith("tambah harga ")){
      data.harga = t.replace("tambah harga ","")
      sock.sendMessage(from,{text:"✅ Harga diupdate"})
      fs.writeFileSync("data.json", JSON.stringify(data,null,2))
    }

    else if(from===adminJid && t.startsWith("tambah stok ")){
      data.stok = t.replace("tambah stok ","")
      sock.sendMessage(from,{text:"✅ Stok diupdate"})
      fs.writeFileSync("data.json", JSON.stringify(data,null,2))
    }

    else if(from===adminJid && t.startsWith("tambah voucher ")){
      let v = t.replace("tambah voucher ","")
      data.voucher.push(v)
      sock.sendMessage(from,{text:"✅ Voucher ditambah"})
      fs.writeFileSync("data.json", JSON.stringify(data,null,2))
    }

    else{
      await sock.sendMessage(from,{text:"Ketik *menu* 😊"})
    }

  })

}

startBot()
