const http = require("http")

const IP = "192.168.4.1"
let log = []
let scan = 0

const G="\x1b[32m"
const R="\x1b[31m"
const Y="\x1b[33m"
const C="\x1b[36m"
const W="\x1b[0m"

function beep(){
 process.stdout.write("\x07")
}

function logo(){
console.clear()
console.log(G)
console.log("██╗  ██╗ █████╗ ██████╗  █████╗ ██╗")
console.log("██║ ██╔╝██╔══██╗██╔══██╗██╔══██╗██║")
console.log("█████╔╝ ███████║██████╔╝███████║██║")
console.log("██╔═██╗ ██╔══██║██╔═══╝ ██╔══██║██║")
console.log("██║  ██╗██║  ██║██║     ██║  ██║███████╗")
console.log("╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚══════╝")
console.log(W)
console.log(C+"════ RADAR KAPAL JS ════"+W)
console.log("\n      \\  |  /")
console.log("   ---- 🚢 ----")
console.log("      /  |  \\")
}

function ambilData(){
 http.get(`http://${IP}`,res=>{
  let data=""
  res.on("data",chunk=>data+=chunk)

  res.on("end",()=>{
   const match = data.match(/[0-9]+\.[0-9]+/)
   if(!match){
    console.log(R+"❌ Data tidak terbaca"+W)
    return
   }

   const suhu = parseFloat(match[0])
   log.push(suhu)
   scan++

   const avg = (log.reduce((a,b)=>a+b,0)/log.length).toFixed(2)
   const max = Math.max(...log)

   console.log(C+"STATUS :"+W,"ONLINE")
   console.log(G+"SUHU   :"+W,suhu,"°C")
   console.log(Y+"RATA2  :"+W,avg,"°C")
   console.log(Y+"MAX    :"+W,max,"°C")
   console.log(C+"SCAN   :"+W,scan)

   if(suhu>50){
    console.log(R+"⚠️ MESIN PANAS!"+W)
    beep(); beep()
   } else {
    console.log(G+"✅ NORMAL"+W)
   }

  })
 }).on("error",()=>{
  console.log(R+"❌ ESP32 OFFLINE"+W)
 })
}

const anim=["|","/","-","\\"]
let i=0

setInterval(()=>{
 logo()
 console.log(Y+"Scanning "+anim[i%4]+W)
 ambilData()
 console.log("\n"+G+new Date().toLocaleTimeString()+W)
 i++
},2000)
