# Pastikan paket routeros_api terinstall
# pip install routeros-api

from routeros_api import RouterOsApiPool, exceptions

class MikroTikAPI:
    def __init__(self, host, username, password, port=8728):
        self.host = host
        self.username = username
        self.password = password
        self.port = port
        self.api = None

    def connect(self):
        try:
            pool = RouterOsApiPool(self.host, username=self.username, password=self.password, port=self.port)
            self.api = pool.get_api()
            print(f"Terkoneksi ke MikroTik {self.host}")
        except exceptions.RouterOsApiConnectionError as e:
            print(f"Gagal koneksi ke MikroTik: {e}")

    def add_hotspot_user(self, name, password, profile="default"):
        if not self.api:
            print("API MikroTik belum terkoneksi")
            return
        try:
            hotspot_user = self.api.get_resource('/ip/hotspot/user')
            hotspot_user.add(name=name, password=password, profile=profile)
            print(f"User {name} berhasil ditambahkan ke hotspot")
        except Exception as e:
            print(f"Gagal tambah user: {e}")

    def list_hotspot_users(self):
        if not self.api:
            print("API MikroTik belum terkoneksi")
            return []
        try:
            hotspot_user = self.api.get_resource('/ip/hotspot/user')
            return hotspot_user.get()
        except Exception as e:
            print(f"Gagal ambil daftar user: {e}")
            return []

    def disconnect(self):
        if self.api:
            self.api.get_api_pool().disconnect()
            print(f"Terputus dari MikroTik {self.host}")