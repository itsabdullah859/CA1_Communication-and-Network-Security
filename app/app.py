from flask import Flask, request, jsonify
import remediation

app = Flask(__name__)

@app.route("/alert", methods=["POST"])
def alert():
    data = request.json

    rule_id = data.get("rule_id")
    description = data.get("description")
    print(f"Rule: {rule_id}")
    
    if rule_id == "777111":
        result = remediation.disable_user()
    elif rule_id == "777222":
        result = remediation.block_ip()
    else:
        result = "No remediation action"

    print(f"Remediation Result: {result}")

    return jsonify({
        "rule_id": rule_id,
        "remediation": result
    })

@app.route("/health")
def health():
    return {"status": "Automation running"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
