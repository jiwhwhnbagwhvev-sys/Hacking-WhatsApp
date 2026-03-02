// ===== RANDOM DELAY 5-10 MENIT =====
function randomDelay() {
  const min = 5 * 60 * 1000   // 5 menit = 300.000 ms
  const max = 10 * 60 * 1000  // 10 menit = 600.000 ms
  return Math.floor(Math.random() * (max - min + 1)) + min
}

// ===== MEMORY USER =====
const lastRequest = {}

sock.ev.on("messages.upsert", async ({ messages }) => {
  const msg = messages[0]
  if (!msg.message) return

  const from = msg.key.remoteJid
  const text =
    msg.message.conversation ||
    msg.message.extendedTextMessage?.text

  if (!text) return

  // ambil nomor dari pesan
  const nomor = text.replace(/[^0-9]/g, "")

  if (nomor.length >= 10) {

    // jika nomor sama → skip
    if (lastRequest[from] === nomor) return
    lastRequest[from] = nomor

    // kirim pesan awal
    await sock.sendMessage(from, {
      text: "⏳ Server sedang membaca, tunggu 5-10 menit..."
    })

    // tunggu beneran random 5-10 menit
    const tunggu = randomDelay()
    console.log(`Menunggu ${Math.floor(tunggu/60000)} menit sebelum kirim balasan ke ${nomor}`)
    await new Promise(r => setTimeout(r, tunggu))

    // kirim pesan sukses
    await sock.sendMessage(from, {
      text: `✅ Server sudah berhasil menjalankan proses ke nomor ${nomor}`
    })
  }
})
