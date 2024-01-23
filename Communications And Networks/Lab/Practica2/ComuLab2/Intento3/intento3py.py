from socket import *
import time
i=0
direccion = ("169.254.41.180", 8000) #leete el arduino
cliente_socket = socket(AF_INET, SOCK_DGRAM)
cliente_socket.settimeout(1)

while(True):
    i=i+1
    try:
        rec_data, addr = cliente_socket.recvfrom(2048)
        grados = float(rec_data)*360/1024
        print("sensor : {0}".format(grados))
        time.sleep(0.001)       
    except:
        print("No se recibió ningun dato.")
    if i<100:
        data = "1" #data a enviar
        cliente_socket = socket(AF_INET, SOCK_DGRAM)
        cliente_socket.sendto(data.encode(), direccion)
    if 200>i>=100:#PONELE MAYOR O IGUAL BOLUDO
        data = "2" #data a enviar
        cliente_socket = socket(AF_INET, SOCK_DGRAM)
        cliente_socket.sendto(data.encode(), direccion)
    if i>=200:
        data = "3" #data a enviar
        cliente_socket = socket(AF_INET, SOCK_DGRAM)
        cliente_socket.sendto(data.encode(), direccion)
