from flask import Flask, request, render_template_string
import json
import random
import string
import os

VOUCHER_FILE = "vouchers.json"

def load_vouchers():
    try:
        with open(VOUCHER_FILE, "r") as f:
            return json.load(f)
    except:
        return []

def save_vouchers(data):
    with open(VOUCHER_FILE, "w") as f:
        json.dump(data, f, indent=4)

def generate_voucher(length=8):
    chars = string.ascii_uppercase + string.digits
    return ''.join(random.choices(chars, k=length))

app = Flask(__name__)

HTML_TEMPLATE = """
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Generate Voucher HP KENTANG</title>
<style>
body { background-color: #000; color: #fff; font-family: monospace; text-align: center; }
input { padding: 5px; margin: 5px; }
button { padding: 5px 10px; margin: 5px; }
</style>
</head>
<body>
<h1>Generate Voucher HP KENTANG</h1>
<form method="POST">
<input type="text" name="username" placeholder="Username">
<button type="submit">Generate Voucher</button>
</form>

{% if voucher %}
<p style="color: yellow;">Voucher untuk {{ username }}: {{ voucher }}</p>
{% endif %}

<h3>Semua Voucher</h3>
<ul>
{% for v in vouchers %}
<li>{{ v.username }} | {{ v.voucher }}</li>
{% endfor %}
</ul>

</body>
</html>
"""

@app.route("/", methods=["GET", "POST"])
def index():
    voucher = None
    username = ""
    vouchers = load_vouchers()
    if request.method == "POST":
        username = request.form.get("username", "").strip()
        voucher = generate_voucher()
        vouchers.append({"username": username, "voucher": voucher})
        save_vouchers(vouchers)
    return render_template_string(HTML_TEMPLATE, voucher=voucher, username=username, vouchers=vouchers)

if __name__ == "__main__":
    print("Server voucher berjalan di http://127.0.0.1:5001")
    app.run(host="0.0.0.0", port=5001)