from socket import *
import time

direccion = ("169.254.41.180", 8000) #leete el arduino

cliente_socket = socket(AF_INET, SOCK_DGRAM)

cliente_socket.settimeout(1)

while(True):

    data = "1" #data a enviar

    cliente_socket.sendto(data.encode(), direccion)

    try:

        rec_data, addr = cliente_socket.recvfrom(2048)

        grados = float(rec_data)*360/1024

        print("sensor : {0}".format(grados))

    except:
        print("No se recibió ningun dato.")

    #time.sleep(2)       
