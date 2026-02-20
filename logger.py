#!/usr/bin/env python3
# ==================================================
#                LOGGER SYSTEM
# ==================================================

import json
import datetime
import sys
import os


class LoggerSystem:
    def __init__(self):
        self.config = self.load_config()
        self.log_file = "activity.log"

    def load_config(self):
        try:
            with open("config.json", "r") as file:
                return json.load(file)
        except FileNotFoundError:
            print("Config file not found!")
            sys.exit(1)

    def save_log(self, username, target_number, module):
        timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        log_entry = (
            f"[{timestamp}] | "
            f"App: {self.config['app_name']} | "
            f"User: {username} | "
            f"Module: {module} | "
            f"Target: {target_number}\n"
        )

        with open(self.log_file, "a") as file:
            file.write(log_entry)


# ================= MAIN =================

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: python3 logger.py <username> <target_number> <module>")
        sys.exit(1)

    username = sys.argv[1]
    target_number = sys.argv[2]
    module = sys.argv[3]

    logger = LoggerSystem()
    logger.save_log(username, target_number, module)

    print("Log saved successfully.")
