import re

def sanitize_input(text):
    """
    Hapus karakter berbahaya dari input
    untuk mencegah XSS / injection
    """
    if not text:
        return ""
    return re.sub(r'[<>;"\']', '', text)

def validate_token(token):
    """
    Token harus 24 karakter, alfanumerik
    """
    if not token:
        return False
    pattern = r'^[a-zA-Z0-9]{24}$'
    return re.match(pattern, token) is not None

def validate_username(username):
    """
    Username hanya alfanumerik, 3-20 karakter
    """
    if not username:
        return False
    pattern = r'^[a-zA-Z0-9]{3,20}$'
    return re.match(pattern, username) is not None

def is_safe_input(text):
    """
    Mengecek apakah input aman
    """
    text = sanitize_input(text)
    return bool(text)