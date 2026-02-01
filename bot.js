// ===== ROOT RAGERS WA BOT MENU DYNAMIC =====
const { default: makeWASocket, useMultiFileAuthState, DisconnectReason, fetchLatestBaileysVersion } = require('@whiskeysockets/baileys')
const Pino = require('pino')
const readline = require('readline-sync')
const chalk = require('chalk')

console.clear()
console.log(chalk.green(`
██████╗  ██████╗  ██████╗
██╔══██╗██╔═══██╗██╔═══██╗
██████╔╝██║   ██║██║   ██║
██╔══██╗██║   ██║██║   ██║
██║  ██║╚██████╔╝╚██████╔╝
╚═╝  ╚═╝╚═════╝  ╚═════╝
`))
console.log(chalk.red(">>> ROOT RAGERS WA BOT MENU DYNAMIC <<<\n"))

const target = readline.question("Nomor admin tujuan (62xxx): ")
const targetJid = target + "@s.whatsapp.net"

// ===== DATA DYNAMIC =====
let harga = "50K"
let stok = "Tersedia"
let voucher = []

async function startBot() {
    const { state, saveCreds } = await useMultiFileAuthState("session")
    const { version } = await fetchLatestBaileysVersion()

    const sock = makeWASocket({ auth: state, logger: Pino({ level: 'silent' }), version })

    sock.ev.on('connection.update', update => {
        const { connection, lastDisconnect, qr } = update
        if(qr) console.log(chalk.yellow('[📌] Scan QR:'), qr)
        if(connection === 'open') console.log(chalk.green('[✓] BOT ONLINE'))
        if(connection === 'close'){
            const reason = lastDisconnect?.error?.output?.statusCode
            if(reason !== DisconnectReason.loggedOut){
                console.log(chalk.red('[!] Terputus, reconnecting...'))
                startBot()
            }
        }
    })

    sock.ev.on('creds.update', saveCreds)

    // ===== PESAN MASUK =====
    sock.ev.on('messages.upsert', async ({ messages }) => {
        const msg = messages[0]
        if(!msg.message || msg.key.fromMe) return

        const from = msg.key.remoteJid
        const text = msg.message.conversation || msg.message.extendedTextMessage?.text || ""
        const t = text.toLowerCase()
        console.log(chalk.cyan(`[Chat] ${from}: ${t}`))

        // ===== AUTO REPLY DYNAMIC MENU =====
        if(t === 'menu'){
            await sock.sendMessage(from, { text:
`📋 MENU
• harga
• stok
• beli
• voucher
• admin
• tambah harga
• tambah stok
• tambah voucher`
            })
        }
        else if(t === 'harga'){
            await sock.sendMessage(from, { text: `💰 Harga sekarang: ${harga}` })
        }
        else if(t === 'stok'){
            await sock.sendMessage(from, { text: `📦 Stok: ${stok}` })
        }
        else if(t === 'beli'){
            await sock.sendMessage(from, { text: "🛒 Order diterima, admin segera proses." })
            await sock.sendMessage(targetJid, { text:`📢 ORDER BARU dari ${from}` })
        }
        else if(t === 'voucher'){
            await sock.sendMessage(from, { text: `🎫 Voucher tersedia: ${voucher.join(", ") || "Tidak ada"}` })
        }
        else if(t === 'admin'){
            await sock.sendMessage(from, { text: '👤 Admin: wa.me/6285283786794' })
        }

        // ===== MENU ADMIN UNTUK UPDATE =====
        else if(t.startsWith('tambah harga ')){
            if(from === targetJid){
                harga = t.replace('tambah harga ','')
                await sock.sendMessage(from,{text:`✅ Harga berhasil diubah: ${harga}`})
            }
        }
        else if(t.startsWith('tambah stok ')){
            if(from === targetJid){
                stok = t.replace('tambah stok ','')
                await sock.sendMessage(from,{text:`✅ Stok berhasil diubah: ${stok}`})
            }
        }
        else if(t.startsWith('tambah voucher ')){
            if(from === targetJid){
                let v = t.replace('tambah voucher ','')
                voucher.push(v)
                await sock.sendMessage(from,{text:`✅ Voucher ditambahkan: ${v}`})
            }
        }

        else {
            await sock.sendMessage(from,{text:'Ketik *menu* ya 😊'})
        }
    })
}

startBot()
