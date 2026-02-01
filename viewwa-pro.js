 const {
 default: makeWASocket,
 useMultiFileAuthState,
 fetchLatestBaileysVersion,
 DisconnectReason,
 downloadMediaMessage
} = require("@whiskeysockets/baileys")

const Pino = require("pino")
const qrcode = require("qrcode-terminal")
const fs = require("fs")
const readline = require("readline")

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
  console.log("\n✅ TERHUBUNG\n")
 }

 if(connection==="close"){
  const reason =
   lastDisconnect?.error?.output?.statusCode

  if(reason!==DisconnectReason.loggedOut){
   start()
  } else {
   console.log("❌ Logout")
  }
 }
})

sock.ev.on("creds.update", saveCreds)

// ===== MONITOR =====
sock.ev.on("messages.upsert", async ({messages})=>{

 const msg = messages[0]
 if(!msg.message) return

 const from = msg.key.remoteJid

// ===== TEXT =====
 const text =
  msg.message.conversation ||
  msg.message.extendedTextMessage?.text

 if(text){
  console.log(`\n📩 ${from}`)
  console.log(`💬 ${text}`)
 }

// ===== IMAGE =====
 if(msg.message.imageMessage){

  console.log(`\n🖼️ Gambar dari ${from}`)

  const buffer =
   await downloadMediaMessage(
    msg,"buffer",{}, {logger:Pino()}
   )

  const fileName =
   `img_${Date.now()}.jpg`

  fs.writeFileSync(fileName, buffer)

  console.log(`📁 Tersimpan: ${fileName}`)
 }

// ===== LOCATION =====
 if(msg.message.locationMessage){

  const loc = msg.message.locationMessage
  const lat = loc.degreesLatitude
  const lng = loc.degreesLongitude

  console.log(`\n📍 Lokasi dari ${from}`)
  console.log(`Latitude : ${lat}`)
  console.log(`Longitude: ${lng}`)
  console.log(
   `🌍 Map: https://maps.google.com/?q=${lat},${lng}`
  )
 }

// ===== REPLY OPTION =====
 if(text || msg.message.imageMessage || msg.message.locationMessage){

  rl.question("\nBalas? (y/n): ", ans=>{
   if(ans==="y"){
    rl.question("Ketik balasan: ", async reply=>{
     await sock.sendMessage(from,{text:reply})
     console.log("✅ Terkirim")
    })
   }
 }

})

}

start()
