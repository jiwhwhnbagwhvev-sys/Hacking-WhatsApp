const {
 default: makeWASocket,
 useMultiFileAuthState,
 fetchLatestBaileysVersion,
 DisconnectReason,
 downloadContentFromMessage
} = require("@whiskeysockets/baileys")

const Pino = require("pino")
const qrcode = require("qrcode-terminal")
const fs = require("fs")
const readline = require("readline")

// ===== READLINE =====
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

// ===== QR LOGIN =====
sock.ev.on("connection.update", update=>{
 const { connection, qr, lastDisconnect } = update

 if(qr){
  console.clear()
  console.log("📱 SCAN QR DI WHATSAPP")
  qrcode.generate(qr,{small:true})
 }

 if(connection==="open"){
  console.log("\n✅ WHATSAPP TERHUBUNG\n")
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

 console.log("\n====================")
 console.log("📩 Dari:", from)

// ===== TEXT =====
 const text =
  msg.message.conversation ||
  msg.message.extendedTextMessage?.text

 if(text){
  console.log("💬 Pesan:", text)

  rl.question("Balas? (y/n): ", ans=>{
   if(ans==="y"){
    rl.question("Ketik balasan: ", async reply=>{
     await sock.sendMessage(from,{text:reply})
     console.log("✅ Terkirim")
    })
   }
  })
 }

// ===== FOTO =====
 if(msg.message.imageMessage){
  const stream =
   await downloadContentFromMessage(
    msg.message.imageMessage,
    "image"
   )

  let buffer = Buffer.from([])
  for await(const chunk of stream){
   buffer = Buffer.concat([buffer, chunk])
  }

  const fileName =
   `/sdcard/Pictures/WA_${Date.now()}.jpg`

  fs.writeFileSync(fileName, buffer)

  console.log("🖼️ Foto diterima!")
  console.log("✅ Tersimpan:", fileName)
 }

// ===== LOKASI =====
 if(msg.message.locationMessage){
  const loc = msg.message.locationMessage

  console.log("📍 Lokasi diterima!")
  console.log("Latitude:", loc.degreesLatitude)
  console.log("Longitude:", loc.degreesLongitude)

  console.log(
   `🌍 Map: https://maps.google.com/?q=${loc.degreesLatitude},${loc.degreesLongitude}`
  )
 }

})

}

start()
