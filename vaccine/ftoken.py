import socket
import threading


def token():
    IP = '192.168.56.1'
    PORT = 5567
    ADDR = (IP, PORT)
    FORMAT = "utf-8"
    DISCONNECT_MSG = "!DISCONNECT"
    SIZE = 1024
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client.connect(ADDR)
    print(f"[CONNECTED] Client connected to server at {IP}:{PORT}")
    m=client.recv(SIZE).decode(FORMAT)
    print(f"[SERVER] {m}")
    connected = True
    if m == "session over":
            connected= False
            
    g = client.recv(SIZE).decode(FORMAT)
    print(f"[SERVER] {g}")
    while connected:
         msg=client.recv(SIZE).decode(FORMAT)
         if msg == 'DONE':
            connected = False
def main():
    for i in range(10):
        
        thread = threading.Thread(target=token)
        thread.start()
if __name__ == "__main__":
    main()
