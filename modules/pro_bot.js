const fs = require("fs")

// ===== DATABASE SIMPLE =====
const dbFile = "./database.json"

function loadDB(){
    if(!fs.existsSync(dbFile)){
        fs.writeFileSync(dbFile, JSON.stringify({users:[]},null,2))
    }
    return JSON.parse(fs.readFileSync(dbFile))
}

function saveDB(data){
    fs.writeFileSync(dbFile, JSON.stringify(data,null,2))
}

module.exports = async (sock, msg) => {
    if (!msg.message) return

    const from = msg.key.remoteJid
    const sender = msg.key.participant || from

    const text =
        msg.message.conversation ||
        msg.message.extendedTextMessage?.text ||
        ""

    const cmd = text.toLowerCase().trim()

    const db = loadDB()

    // ===== AUTO SAVE USER =====
    if(!db.users.includes(sender)){
        db.users.push(sender)
        saveDB(db)
    }

    // ===== MENU =====
    if(cmd === "menu"){
        await sock.sendMessage(from,{
text:
`🔥 *ROOT RAGERS PRO BOT* 🔥

📌 COMMAND LIST
━━━━━━━━━━━━━━━
• menu
• ping
• owner
• about
• runtime
• usercount
• promo
• script

Ketik salah satu`
        })
    }

    // ===== PING =====
    else if(cmd === "ping"){
        await sock.sendMessage(from,{text:"🏓 PONG!\nBot aktif & responsif"})
    }

    // ===== OWNER =====
    else if(cmd === "owner"){
        await sock.sendMessage(from,{
            text:"👑 Owner Bot:\nwa.me/6285283786794"
        })
    }

    // ===== ABOUT =====
    else if(cmd === "about"){
        await sock.sendMessage(from,{
text:
`🤖 ROOT RAGERS BOT

✔ Real WhatsApp Bot
✔ Multi Command
✔ Database System
✔ Baileys Engine
✔ Auto Save User

Status: ONLINE`
        })
    }

    // ===== RUNTIME =====
    else if(cmd === "runtime"){
        const up = process.uptime()
        await sock.sendMessage(from,{
            text:`⏱ Runtime: ${Math.floor(up/60)} menit`
        })
    }

    // ===== USER COUNT =====
    else if(cmd === "usercount"){
        await sock.sendMessage(from,{
            text:`👥 Total User:\n${db.users.length}`
        })
    }

    // ===== PROMO AUTO SELL =====
    else if(cmd === "promo"){
        await sock.sendMessage(from,{
text:
`💎 PROMO TOPUP GAME

🔥 Free Fire
🔥 MLBB
🔥 PUBG

Harga murah & aman
Minat? Chat Owner`
        })
    }

    // ===== SCRIPT INFO =====
    else if(cmd === "script"){
        await sock.sendMessage(from,{
            text:"📦 Script by Root Ragers\nEngine: Baileys MD"
        })
    }
}
