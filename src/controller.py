import socket
import json
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

HOST = "127.0.0.1"
PORT = 65432

def handle_command(cmd):
    try:
        if cmd["action"] == "write":
            pin = cmd["pin"]
            value = cmd["value"]
            GPIO.setup(pin, GPIO.OUT)
            GPIO.output(pin, GPIO.HIGH if value else GPIO.LOW)
            return {"status": "ok"}
        elif cmd["action"] == "read":
            pin == cmd["pin"]
            GPIO.setup(pin, GPIO.IN)
            return {"status": "ok", "value": GPIO.input(pin)}
        else:
            return {"status": "error", "message": "Unknown action"}
    except Exception as e:
        return {"status": "error", "message": str(e)}

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    print("GPIO server active...")
    while True:
        conn, addr = s.accept()
        with conn:
            data = conn.recv(1234)
            if not data:
                continue
            try:
                cmd = json.loads(data.decode())
                result = handle_command(cmd)
                conn.sendall(json.dumps(result).encode())
            except json.JSONDecodeError:
                conn.sendall(b'{"status":"error","message":"invalid json"}')