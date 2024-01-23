import matplotlib.pyplot as plt
import collections
import numpy as np
import serial
import time
import csv
from matplotlib.lines import Line2D
from tkinter import *
import matplotlib.animation as animation

port = "com2"

def getSerialData(self, Samples, numData, serialConnection, lines):
    for i in range(numData):
        a = serialConnection.read(4)
        b = a[0]
        value = ((b/0.75757575757575)/100)

        data[i].append(value)                              #Guarda lectura en la ultima posicion
        lines[i].set_data(range(Samples),data[i])          #Dibujar nueva linea

serialConnection = serial.Serial(port, 9600)

Samples = 100
sampleTime = 10                                         #Tiempo de muestreo
numData=3                                                  #Cantidad de sensores
lines = []
data = []
lines2=[]
data2=[]

for i in range(numData):
    data.append(collections.deque([0] * Samples, maxlen=Samples))    #Creacion de lista
    lines.append(Line2D([],[],color='red'))

def grafica1():
    #Limites de los Ejes
    serialConnection.write(str.encode('a'))
    time.sleep(1)
    xmin=0
    xmax=Samples
    ymin =0
    ymax =3.5
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

def  makeCSV():

    dblen = len(data)

    for i in range(dblen):
        with open('muestras.csv', 'w', encoding='utf-8') as File:
            writer = csv.writer(File)
            writer.writerow(data[i])

    File.close()
    ventana.mainloop()
    serialConnection.close()

ventana =Frame(height=300,width=420)
ventana.pack(padx=10, pady=10)
ventana.configure(background='gray')
Titulo= Label(text="Práctica 1",font=("Verdana",15)).place(x=170,y=50)
boton1= Button(ventana,font=("Verdana",8),command=grafica1, text=("Grafica sensor 1"), width=30,heigh=3).place(x=100,y=100)
boton2= Button(ventana,font=("Verdana",8),command=makeCSV, text=("Guardar en disco duro"), width=30,heigh=3).place(x=100,y=200)
ventana.mainloop()
serialConnection.close()
