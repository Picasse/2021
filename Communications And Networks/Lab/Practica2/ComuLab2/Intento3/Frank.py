import serial
import time
import collections
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from tkinter import *
from matplotlib.lines import Line2D
import numpy as np

#########################################################################################################
from socket import *
import time
data4 = "1" 
direccion = ("169.254.41.180", 8000) #leete el arduino
cliente_socket = socket(AF_INET, SOCK_DGRAM)
cliente_socket.settimeout(1)

#########################################################################################################
def getSerialData(self,Samples,numData,lines):
    
    
    cliente_socket.sendto(data4.encode(), direccion)
    #time.sleep(0.2)       
    for i in range(numData):
        
        rec_data, addr = cliente_socket.recvfrom(2048)
        grados = float(rec_data)*360/1024
        print(grados)
        data[i].append(grados)                              #Guarda lectura en la ultima posicion
        lines[i].set_data(range(Samples),data[i])          #Dibujar nueva linea
        #time.sleep(0.2)  
        data2[i].append(grados)                              
        lines2[i].set_data(range(Samples),data2[i])     
                                         #Baudios

Samples = 100                                               #Numero de muestras
sampleTime = 100                                           #Tiempo de muestreo
numData=3                                                #Cantidad de sensores
lines = []
data = []
lines2=[]
data2=[]
for i in range(numData):
    data.append(collections.deque([0] * Samples, maxlen=Samples))    #Creacion de lista
    lines.append(Line2D([],[],color='red'))
#########################################################################################################
def grafica1():
    #Limites de los Ejes
    time.sleep(1)
    xmin=0
    xmax=Samples
    ymin =0
    ymax =370
    fig = plt.figure(figsize=(13,16))                      #Defino tamañano de la ventana y Crea una nueva figura
    ax1 = plt.axes(xlim=(xmin,xmax),ylim=(ymin,ymax))      #Creo los ejes de la grafica
    plt.title('Sensor # 1')
    ax1.set_xlabel("Muestras")
    ax1.set_ylabel("Grados Sensor 1")
    ax1.add_line(lines[0])                                 #Se elige la variable a graficar
    anim = animation.FuncAnimation(fig,getSerialData, fargs =(Samples,numData,lines),interval=sampleTime)
    plt.show()
    ventana.mainloop()
##############################################################################-51###########################
def grafica2():
    #Limites de los Ejes
    #serialConnection.write(str.encode('b'))
    time.sleep(1)
    xmin=0
    xmax=Samples
    ymin =0
    ymax =370
    fig = plt.figure(figsize=(13,16))                    #Defino tamañano de la ventana y Crea una nueva figura
    ax2 = plt.axes(xlim=(xmin,xmax),ylim=(ymin,ymax))    #Creo los ejes de la grafica
    plt.title('Sensor # 2')
    ax2.set_xlabel("Muestras")
    ax2.set_ylabel("voltaje")
    ax2.add_line(lines[1])                               #Se elige la variable a graficar
    anim = animation.FuncAnimation(fig,getSerialData, fargs =(Samples,numData,lines),interval=sampleTime)
    plt.show()
    ventana.mainloop()
#########################################################################################################
def grafica3():
    #Limites de los Ejes
    #serialConnection.write(str.encode('b'))
    time.sleep(1)
    xmin=0
    xmax=Samples
    ymin =0
    ymax =370
    fig = plt.figure(figsize=(13,16))                    #Defino tamañano de la ventana y Crea una nueva figura
    ax3 = plt.axes(xlim=(xmin,xmax),ylim=(ymin,ymax))    #Creo los ejes de la grafica
    plt.title('Sensor # 3')
    ax3.set_xlabel("Muestras")
    ax3.set_ylabel("voltaje")
    ax3.add_line(lines[2])                               #Se elige la variable a graficar
    anim = animation.FuncAnimation(fig,getSerialData, fargs =(Samples,numData,lines),interval=sampleTime)
    plt.show()
    ventana.mainloop()
#########################################################################################################

#########################################################################################################







    
ventana =Frame(height=500,width=435)
ventana.pack(padx=10, pady=10)
ventana.configure(background='gray')
Titulo= Label(text="Graficas en tiempo real de sensores",font=("Verdana",15)).place(x=35,y=50)
boton1= Button(ventana,font=("Verdana",8),command=grafica1, text=("Grafica sensor 1"), width=30,heigh=3).place(x=100,y=100)
boton2= Button(ventana,font=("Verdana",8),command=grafica2, text=("Grafica sensor 2"), width=30,heigh=3).place(x=100,y=200)
boton3= Button(ventana,font=("Verdana",8),command=grafica3, text=("Grafica sensor 3"), width=30,heigh=3).place(x=100,y=300)

ventana.mainloop()
