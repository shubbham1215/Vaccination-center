import socket
import threading
import datetime
import time
import random

SIZE=1024	
IP = '10.8.1.48'
PORT = 5567
ADDR = (IP, PORT)
FORMAT = "utf-8"
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(ADDR)
DISCONNECT_MSG = "!DISCONNECT"
queue_conn=[]
queue_addr=[]
ag=[0,0,0]
count=[]

def handle_client(c,a):
    now = datetime.datetime.now()
    timestamp = now.strftime("%H:%M:%S")
    print(f"[NEW CONNECTION] {a} connected.")
    d=count.pop(0)
    
    
    if ag[0]==0:
       print("client",a,"connected to executive 1 at time",timestamp)
       print("token",d,"-window 1")
       g=f"your window is 1"
       ag[0]=1
       t=1
    elif ag[1]==0:
       print("client",a,"connected to executive 2 at time",timestamp)
       print("token",d,"- window 2")
       g=f"your window is 2"
       ag[1]=1
       t=2
    elif ag[2]==0:
       print("client",a,"connected to executive 3 at time",timestamp)
       print("token",d,"- window 3")
       g=f"your window is 3"
       ag[2]=1
       t=3
    r=random.randint(20,25)
    time.sleep(r)
    print("client",a,"executed for",r,"sec")
    if t==1:
                ag[0]=0
                print("window 1 free")
    elif t==2:
                ag[1]=0
                print("window 2 free")
    elif t==3:    
                ag[2]=0
                print("window 3 free")
    e=f"DONE"            
    c.send(e.encode(FORMAT))            
    create(queue_conn,queue_addr)
    c.close()


def create(queue_conn,queue_addr):
    if len(queue_conn)!=0:
          c=queue_conn.pop(0)
          a=queue_addr.pop(0)
          
          thread = threading.Thread(target=handle_client, args=(c,a))
          thread.start()
          
def main():
    print("[STARTING] Server is starting...")
    
    server.listen()
    print(f"[LISTENING] Server is listening on {IP}:{PORT}")
    
    z=0
    while True:
        
        conn, addr = server.accept()
        if z<5:
         queue_conn.append(conn)
         queue_addr.append(addr)
         z=z+1
         count.append(z)
         
         if threading.activeCount()-1<3:
           m=f"your token number is "+str(z)
           conn.send(m.encode(FORMAT))
           create(queue_conn,queue_addr)
         else:
           m=f"your token number is "+str(z)+" and wait"
           conn.send(m.encode(FORMAT))
        else:
            m=f"session over"
            conn.send(m.encode(FORMAT))
              

if __name__ == "__main__":
    main()
