const {
 default: makeWASocket,
 useMultiFileAuthState,
 fetchLatestBaileysVersion,
 DisconnectReason,
 downloadMediaMessage
} = require("@whiskeysockets/baileys")

const Pino = require("pino")
const qrcode = require("qrcode-terminal")
const readline = require("readline")
const fs = require("fs")

const rl = readline.createInterface({
 input: process.stdin,
 output: process.stdout
})

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

// ===== QR =====
sock.ev.on("connection.update", update=>{
 const { connection, qr, lastDisconnect } = update

 if(qr){
  console.clear()
  console.log("📱 SCAN QR DI WHATSAPP")
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

// ===== TEXT =====
 const text =
  msg.message.conversation ||
  msg.message.extendedTextMessage?.text

 if(text){
  console.log(`\n📩 Dari ${from}`)
  console.log(`💬 ${text}\n`)
 }

// ===== FOTO =====
 if(msg.message.imageMessage){
  console.log(`\n🖼️ Foto diterima dari ${from}`)

  const buffer = await downloadMediaMessage(
    msg,
    "buffer",
    {},
    { logger:Pino(), reuploadRequest:sock.updateMediaMessage }
  )

  const fileName = `foto_${Date.now()}.jpg`
  fs.writeFileSync(fileName, buffer)

  console.log(`✅ Foto disimpan: ${fileName}`)
 }

// ===== LOKASI =====
 if(msg.message.locationMessage){
  const loc = msg.message.locationMessage

  console.log("\n📍 Lokasi diterima")
  console.log("Latitude :", loc.degreesLatitude)
  console.log("Longitude:", loc.degreesLongitude)
 }

// ===== BALAS =====
 if(text){
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
