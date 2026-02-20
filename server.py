from flask import Flask, render_template_string, request
from core.server_helper import load_users, save_users, generate_user
from core.premium import check_user
import os

app = Flask(__name__)

HTML_TEMPLATE = """
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>HP KENTANG HOTSPOT</title>
<style>
body { background-color: #000; color: #fff; font-family: monospace; text-align: center; }
input { padding: 5px; margin: 5px; }
button { padding: 5px 10px; margin: 5px; }
</style>
</head>
<body>
<h1>HP KENTANG HOTSPOT</h1>
<h3>Login Premium</h3>
<form method="POST">
<input type="text" name="username" placeholder="Username">
<input type="text" name="token" placeholder="Token">
<button type="submit">Login</button>
</form>

{% if message %}
<p style="color: yellow;">{{ message }}</p>
{% endif %}

<h3>User Online</h3>
<ul>
{% for u in online %}
<li>{{ u.username }} | Voucher: {{ u.voucher }}</li>
{% endfor %}
</ul>

</body>
</html>
"""

@app.route("/", methods=["GET", "POST"])
def index():
    message = ""
    online_users = load_users()
    if request.method == "POST":
        username = request.form.get("username", "").strip()
        token = request.form.get("token", "").strip()
        valid, real_token = check_user(username)
        if valid and token == real_token:
            # generate user voucher baru
            new_user = generate_user(username)
            message = f"Login berhasil! Voucher: {new_user['voucher']}"
            # set status online
            for u in online_users:
                if u["username"] == username:
                    u["status"] = "online"
            save_users(online_users)
        else:
            message = "Login gagal! Username atau token tidak valid."

    online = [u for u in online_users if u["status"] == "online"]
    return render_template_string(HTML_TEMPLATE, online=online, message=message)

if __name__ == "__main__":
    print("Server berjalan di http://127.0.0.1:5000")
    app.run(host="0.0.0.0", port=5000)