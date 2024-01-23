import serial
import time
import collections
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from tkinter import *
from matplotlib.lines import Line2D
import numpy as np
    
def getSerialData(self,Samples,numData,serialConnection,lines):
    for i in range(numData):
        value = float(serialConnection.readline().strip()) #Leer sensor
        print(value)
        data[i].append(value)                              #Guarda lectura en la ultima posicion
        lines[i].set_data(range(Samples),data[i])          #Dibujar nueva linea

        data2[i].append(value)                              
        lines2[i].set_data(range(Samples),data2[i])     

serialPort = 'COM2'                                        #Puerto Serial Arduino
baudRate = 9600                                            #Baudios
try:
    serialConnection = serial.Serial(serialPort,baudRate)  #Instanciar objeto serial
except:
    print('No se conecto al puerto')

Samples = 100                                               #Numero de muestras
sampleTime = 100                                           #Tiempo de muestreo
numData=3                                                  #Cantidad de sensores
lines = []
data = []
lines2=[]
data2=[]
for i in range(numData):
    data.append(collections.deque([0] * Samples, maxlen=Samples))    #Creacion de lista
    lines.append(Line2D([],[],color='red'))

    data2.append(collections.deque([0] * Samples, maxlen=Samples))    #Creacion de lista
    lines2.append(Line2D([],[],color='red'))
def grafica1():     
    #Limites de los Ejes
    #serialConnection.write(str.encode('a'))
    time.sleep(1)
    xmin=0
    xmax=Samples
    ymin =0
    ymax =6
    fig = plt.figure(figsize=(13,16))                      #Defino tamañano de la ventana y Crea una nueva figura
    ax1 = plt.axes(xlim=(xmin,xmax),ylim=(ymin,ymax))      #Creo los ejes de la grafica
    plt.title('Sensor # 1')
    ax1.set_xlabel("Muestras")
    ax1.set_ylabel("voltaje")
    ax1.add_line(lines[0])                                 #Se elige la variable a graficar
    anim = animation.FuncAnimation(fig,getSerialData, fargs =(Samples,numData,serialConnection,lines),interval=sampleTime)
    plt.show()
    ventana.mainloop()
    serialConnection.close()

def grafica2():     
    #Limites de los Ejes
    #serialConnection.write(str.encode('b'))
    time.sleep(1)
    xmin=0
    xmax=Samples
    ymin =0
    ymax =6
    fig = plt.figure(figsize=(13,16))                    #Defino tamañano de la ventana y Crea una nueva figura
    ax2 = plt.axes(xlim=(xmin,xmax),ylim=(ymin,ymax))    #Creo los ejes de la grafica
    plt.title('Sensor # 2')
    ax2.set_xlabel("Muestras")
    ax2.set_ylabel("voltaje")
    ax2.add_line(lines[1])                               #Se elige la variable a graficar
    anim = animation.FuncAnimation(fig,getSerialData, fargs =(Samples,numData,serialConnection,lines),interval=sampleTime)
    plt.show()
    ventana.mainloop()
    serialConnection.close()
    
def grafica3():     
    #Limites de los Ejes
    #serialConnection.write(str.encode('c'))
    #time.sleep(1)
    xmin=0
    xmax=Samples
    ymin =0
    ymax =6
    fig = plt.figure(figsize=(13,16))     
    ax3 = plt.axes(xlim=(xmin,xmax),ylim=(ymin,ymax))
    plt.title('Sensor # 3')
    ax3.set_xlabel("Muestras")
    ax3.set_ylabel("voltaje")
    ax3.add_line(lines[2])
    anim = animation.FuncAnimation(fig,getSerialData, fargs =(Samples,numData,serialConnection,lines),interval=sampleTime)
    plt.show()
    ventana.mainloop()
    serialConnection.close()
    
def grafica4():     
    #Limites de los Ejes
    #serialConnection.write(str.encode('d'))
    #time.sleep(1)
    xmin=0
    xmax=Samples
    ymin = [0,0,0]
    ymax = [6,6,6]

    fig = plt.figure(figsize=(13,16))                                         #Crea una nueeva figura
    ax4 = fig.add_subplot(3,1,1,xlim=(xmin,xmax),ylim=(ymin[0],ymax[0]))
    ax4.title.set_text('Sensor # 1')
    ax4.set_ylabel("voltaje")
    ax4.add_line(lines2[0])
   
    ax5 = fig.add_subplot(3,1,2,xlim=(xmin,xmax),ylim=(ymin[1],ymax[1]))
    ax5.title.set_text('Sensor # 2')
    ax5.set_ylabel("voltaje")
    ax5.add_line(lines2[1])
    
    ax6 = fig.add_subplot(3,1,3,xlim=(xmin,xmax),ylim=(ymin[2],ymax[2]))
    ax6.title.set_text('Sensor # 3')
    ax6.set_xlabel("Muestras")
    ax6.set_ylabel("voltaje")
    ax6.add_line(lines2[2])
    
    anim = animation.FuncAnimation(fig,getSerialData, fargs =(Samples,numData,serialConnection,lines),interval=sampleTime)
    plt.show()
    ventana.mainloop()
    serialConnection.close()
   
ventana =Frame(height=500,width=435)
ventana.pack(padx=10, pady=10)
ventana.configure(background='gray')
Titulo= Label(text="Graficas en tiempo real de sensores",font=("Verdana",15)).place(x=35,y=50)
boton1= Button(ventana,font=("Verdana",8),command=grafica1, text=("Grafica sensor 1"), width=30,heigh=3).place(x=100,y=100)
boton2= Button(ventana,font=("Verdana",8),command=grafica2, text=("Grafica sensor 2"), width=30,heigh=3).place(x=100,y=200)
boton3= Button(ventana,font=("Verdana",8),command=grafica3, text=("Grafica sensor 3"), width=30,heigh=3).place(x=100,y=300)
boton4= Button(ventana,font=("Verdana",8),command=grafica4, text=("Todas las Graficas"), width=30,heigh=3).place(x=100,y=400)
ventana.mainloop()
serialConnection.close()


