import os

# ===== COLOR =====
WHITE = "\033[97m"
RED = "\033[91m"
GREEN = "\033[92m"
YELLOW = "\033[93m"
RESET = "\033[0m"

# ===== CLEAR SCREEN =====
def clear_screen():
    os.system("clear")

# ===== PENGUIN MERAH =====
def red_penguin():
    print(RED + r"""
        █████████████
     ████             ████
   ███                     ███
  ██      ███         ███      ██
 ██      ███████     ███████      ██
 ██         █████       █████        ██
 ██           ███         ███          ██
  ██                                         ██
   ██                                       ██
     ██                                   ██
       ███                               ███
          ████████           ████████
               ██             ██
               ██             ██

              HP KENTANG
    """ + RESET)

# ===== BANNER =====
def banner():
    print(GREEN + "===============================")
    print("       HP KENTANG HOTSPOT       ")
    print("===============================" + RESET)