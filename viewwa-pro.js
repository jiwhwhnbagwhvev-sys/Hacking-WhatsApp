const {
  default: makeWASocket,
  useMultiFileAuthState,
  DisconnectReason,
  fetchLatestBaileysVersion,
  downloadMediaMessage
} = require("@whiskeysockets/baileys")

const P = require("pino")
const fs = require("fs")
const qrcode = require("qrcode-terminal")

console.clear()

console.log("=== VIEW WA TERMINAL ===")

async function start(){

const { state, saveCreds } =
  await useMultiFileAuthState("session_view")

const { version } =
  await fetchLatestBaileysVersion()

const sock = makeWASocket({
  auth: state,
  logger: P({level:"silent"}),
  version
})

sock.ev.on("creds.update", saveCreds)


// ===== CONNECTION =====
sock.ev.on("connection.update", (update)=>{
  const { connection, qr, lastDisconnect } = update

  if(qr){
    console.log("\nSCAN QR DI WHATSAPP:")
    qrcode.generate(qr,{small:true})
  }

  if(connection==="open"){
    console.log("\n✅ TERHUBUNG KE WHATSAPP\n")
  }

  if(connection==="close"){
    const shouldReconnect =
      lastDisconnect?.error?.output?.statusCode !==
      DisconnectReason.loggedOut

    if(shouldReconnect){
      console.log("Reconnect...")
      start()
    }
  }
})


// ===== MONITOR CHAT =====
sock.ev.on("messages.upsert", async ({messages})=>{

const m = messages[0]
if(!m.message) return

const from = m.key.remoteJid

console.log("\n====================")
console.log("Dari:", from)

// TEXT
if(m.message.conversation){
  console.log("Pesan:", m.message.conversation)
}

// EXTENDED TEXT
if(m.message.extendedTextMessage){
  console.log("Pesan:", m.message.extendedTextMessage.text)
}

// IMAGE
if(m.message.imageMessage){
  console.log("📷 Gambar diterima")

  const buffer =
    await downloadMediaMessage(
      m,
      "buffer",
      {},
      { logger:P({level:"silent"}) }
    )

  const name = "img_"+Date.now()+".jpg"
  fs.writeFileSync(name,buffer)
  console.log("Tersimpan:", name)
}

// LOCATION
if(m.message.locationMessage){
  const loc = m.message.locationMessage
  console.log("📍 Lokasi:")
  console.log("Latitude:", loc.degreesLatitude)
  console.log("Longitude:", loc.degreesLongitude)
}

})

}

start()
