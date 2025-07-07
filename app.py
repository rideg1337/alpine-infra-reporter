from flask import Flask, jsonify
import psutil
import socket
import time

app = Flask(__name__)

def get_system_info():
    uptime_seconds = time.time() - psutil.boot_time()
    return {
        "hostname": socket.gethostname(),
        "uptime_seconds": int(uptime_seconds),
        "cpu_percent": psutil.cpu_percent(interval=1),
        "memory_percent": psutil.virtual_memory().percent,
        "disk_percent": psutil.disk_usage('/').percent,
    }

@app.route('/status')
def status():
    return jsonify(get_system_info())

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5055)
