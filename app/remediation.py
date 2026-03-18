import datetime

def disable_user():
    log_action("User disabled.")
    return "User disabled"

def block_ip():
    log_action("IP blocked.")
    return "IP blocked"

def log_action(message):
    with open("remediation.log", "a") as f:
        f.write(f"{datetime.datetime.now()} - {message}\n")
