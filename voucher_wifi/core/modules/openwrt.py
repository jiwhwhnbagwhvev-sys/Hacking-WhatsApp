import paramiko

class OpenWRT:
    def __init__(self, host, username, password, port=22):
        self.host = host
        self.username = username
        self.password = password
        self.port = port
        self.ssh = None

    def connect(self):
        try:
            self.ssh = paramiko.SSHClient()
            self.ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            self.ssh.connect(self.host, port=self.port, username=self.username, password=self.password)
            print(f"Terkoneksi ke OpenWRT {self.host}")
        except Exception as e:
            print(f"Gagal koneksi ke OpenWRT: {e}")

    def add_hotspot_user(self, name, password):
        if not self.ssh:
            print("SSH belum terkoneksi")
            return
        try:
            cmd = f"uci add wireless.@wifi-iface[0].ssid='{name}'"
            stdin, stdout, stderr = self.ssh.exec_command(cmd)
            stdout.channel.recv_exit_status()
            print(f"User hotspot {name} berhasil dibuat di OpenWRT")
        except Exception as e:
            print(f"Gagal tambah user: {e}")

    def list_hotspot_users(self):
        if not self.ssh:
            print("SSH belum terkoneksi")
            return []
        try:
            cmd = "uci show wireless"
            stdin, stdout, stderr = self.ssh.exec_command(cmd)
            output = stdout.read().decode()
            return output.splitlines()
        except Exception as e:
            print(f"Gagal ambil daftar user: {e}")
            return []

    def disconnect(self):
        if self.ssh:
            self.ssh.close()
            print(f"Terputus dari OpenWRT {self.host}")