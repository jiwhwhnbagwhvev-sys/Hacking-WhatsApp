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

  // ambil angka dari pesan
  const nomor = text.replace(/[^0-9]/g, "")

  // ===== JIKA ADA NOMOR =====
  if (nomor.length >= 10) {

    // 🚫 jika nomor sama dengan sebelumnya → abaikan
    if (lastRequest[from] === nomor) {
      return
    }

    // simpan nomor terakhir
    lastRequest[from] = nomor

    // pesan awal
    await sock.sendMessage(from, {
      text: "⏳ Server sedang membaca, tunggu 5-10 menit..."
    })

    // delay (ubah bebas)
    await new Promise(r => setTimeout(r, 15000))

    // pesan sukses
    await sock.sendMessage(from, {
      text: `✅ Server sudah berhasil menjalankan proses ke nomor ${nomor}`
    })
  }
})
