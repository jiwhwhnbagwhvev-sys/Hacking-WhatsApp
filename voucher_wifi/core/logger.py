import json
from datetime import datetime

LOG_FILE = "logs.json"

def load_logs():
    try:
        with open(LOG_FILE, "r") as f:
            return json.load(f)
    except:
        return []

def save_logs(logs):
    with open(LOG_FILE, "w") as f:
        json.dump(logs, f, indent=4)

def add_log(action, detail=""):
    logs = load_logs()
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    logs.append({
        "timestamp": timestamp,
        "action": action,
        "detail": detail
    })
    save_logs(logs)

def show_logs():
    logs = load_logs()
    if not logs:
        print("Tidak ada log aktivitas.")
        return
    print("\n=== LOG AKTIVITAS ===\n")
    for log in logs:
        print(f"[{log['timestamp']}] {log['action']} - {log['detail']}")