const {
 default: makeWASocket,
 useMultiFileAuthState,
 fetchLatestBaileysVersion,
 DisconnectReason
} = require("@whiskeysockets/baileys")

const Pino = require("pino")
const qrcode = require("qrcode-terminal")
const readline = require("readline")

// ===== INPUT BALAS CHAT =====
const rl = readline.createInterface({
 input: process.stdin,
 output: process.stdout
})

// ===== START =====
async function start(){

 const { state, saveCreds } =
  await useMultiFileAuthState("session_view")

 const { version } =
  await fetchLatestBaileysVersion()

 const sock = makeWASocket({
  auth: state,
  version,
  logger: Pino({level:"silent"})
 })

// ===== QR CODE =====
sock.ev.on("connection.update", update=>{
 const { connection, qr, lastDisconnect } = update

 if(qr){
  console.clear()
  console.log("📱 SCAN QR INI DI WHATSAPP")
  qrcode.generate(qr,{small:true})
 }

 if(connection==="open"){
  console.log("\n✅ TERHUBUNG KE WHATSAPP\n")
 }

 if(connection==="close"){
  const reason =
   lastDisconnect?.error?.output?.statusCode

  if(reason!==DisconnectReason.loggedOut){
   start()
  } else {
   console.log("❌ Logout, scan ulang")
  }
 }
})

sock.ev.on("creds.update", saveCreds)

// ===== MONITOR CHAT =====
sock.ev.on("messages.upsert", async ({messages})=>{

 const msg = messages[0]
 if(!msg.message) return

 const from = msg.key.remoteJid

 const text =
  msg.message.conversation ||
  msg.message.extendedTextMessage?.text

 if(text){
  console.log(`\n📩 Dari ${from}`)
  console.log(`💬 ${text}\n`)

  rl.question("Balas? (y/n): ", ans=>{
   if(ans==="y"){
    rl.question("Ketik balasan: ", async reply=>{
     await sock.sendMessage(from,{text:reply})
     console.log("✅ Terkirim\n")
    })
   }
  })
 }

})

}

start()
