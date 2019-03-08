from os import system
import socket
import time

def isOpen(port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    result =  sock.connect_ex(('127.0.0.1', int(port)))
    sock.close()
    return result

def BchNodeUp():
      system("cd ~/bitprim-insight/bitprim.insight;nohup dotnet bin/Release/netcoreapp2.0/bitprim.insight.dll --server.port=3000 --server.address=0.0.0.0 &")

def Bch_check():
     result = isOpen(3000)
     if result == 0:
         pass
     else:
         print("was down")
         print(time.time())
         BchNodeUp()

while True:
    Bch_check()
    time.sleep(10)