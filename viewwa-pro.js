const {
 default: makeWASocket,
 useMultiFileAuthState,
 fetchLatestBaileysVersion,
 downloadMediaMessage
} = require("@whiskeysockets/baileys")

const Pino = require("pino")
const readline = require("readline-sync")
const qrcode = require("qrcode-terminal")
const fs = require("fs")

async function start(){

const { state, saveCreds } =
 await useMultiFileAuthState("view-session")

const { version } =
 await fetchLatestBaileysVersion()

const sock = makeWASocket({
 auth: state,
 logger: Pino({level:"silent"}),
 version
})

// ===== QR =====
sock.ev.on("connection.update", (update)=>{
 const { connection, qr } = update

 if(qr){
  console.log("\nScan QR berikut di WhatsApp:\n")
  qrcode.generate(qr,{small:true})
 }

 if(connection==="open"){
  console.log("\n✅ WhatsApp Terhubung\n")
 }
})

sock.ev.on("creds.update", saveCreds)

// ===== PESAN MASUK =====
sock.ev.on("messages.upsert", async ({messages})=>{

const m = messages[0]
if(!m.message) return

const from = m.key.remoteJid

console.log("\n====================")
console.log("📩 Dari:", from)

// ===== TEXT =====
let text=""

if(m.message.conversation)
 text = m.message.conversation

if(m.message.extendedTextMessage)
 text = m.message.extendedTextMessage.text

if(text){
 console.log("💬 Pesan:", text)
}

// ===== GAMBAR =====
if(m.message.imageMessage){
 console.log("📷 Gambar diterima")

 const buffer =
  await downloadMediaMessage(
   m,"buffer",{},{}
  )

 const file = `img_${Date.now()}.jpg`
 fs.writeFileSync(file,buffer)

 console.log("Tersimpan:", file)
}

// ===== LOKASI =====
if(m.message.locationMessage){
 const loc = m.message.locationMessage

 console.log("📍 Lokasi:")
 console.log("Latitude:", loc.degreesLatitude)
 console.log("Longitude:", loc.degreesLongitude)
}

// ===== BALAS =====
let reply =
 readline.question("Balas (enter = skip): ")

if(reply){
 await sock.sendMessage(from,{text:reply})
 console.log("✅ Terkirim")
}

})

}

start()
