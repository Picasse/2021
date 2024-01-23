import serial
import time
import collections
import tkinter as tk
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from matplotlib.lines import Line2D
import numpy as np



def getSerialData(self,Samples,numData,serialConnection, lines):
    for i in range(numData):
        value  = float(serialConnection.readline().strip())  #Leer sensor / Read sensor
        print(value)
        data[i].append(value) #Guarda lectura en la última posición / #Save reading in the end position
        lines[i].set_data(range(Samples),data[i]) # Dibujar nueva linea / Drawn new line

        
serialPort = 'COM2' # Puerto serial arduino / Arduino serial port
baudRate =9600  # Baudios
a=3
try:
  serialConnection = serial.Serial(serialPort, baudRate) # Instanciar objeto Serial / Instance Serial Object
except:
  print('Cannot conect to the port')

Samples = 200  #Muestras / Samples
sampleTime = 5  #Tiempo de muestreo / Sample Time
numData = 3


# Limites de los ejes / Axis limit
xmin = 0
xmax = Samples
ymin = [0, 0 , 0 ]
ymax = [6, 6 , 6 ]
lines = []
data = []

for i in range(numData):
    data.append(collections.deque([0] * Samples, maxlen=Samples))
    lines.append(Line2D([], [], color='red'))
    lines.append(Line2D([], [], color='blue'))
    lines.append(Line2D([], [], color='yellow'))
  
fig = plt.figure()# Crea una nueva figura #Create a new figure.

def show0():
    ax1.add_line(lines[0])
def show1():
    ax1.add_line(lines[1])
def show2():
    ax1.add_line(lines[2])
def show3():
    plt.show()
    
root = tk.Tk()
frame = tk.Frame(root)
frame.pack()
button = tk.Button(frame, 
                   text="First Plot", 
                   fg="red",
                   command=show0)
button.pack(side=tk.LEFT)

button = tk.Button(frame, 
                   text="Second Plot", 
                   fg="blue",
                   command=show1)
button.pack(side=tk.LEFT)

button = tk.Button(frame, 
                   text="Third Plot", 
                   fg="green",
                   command=show2)
button.pack(side=tk.LEFT)

button = tk.Button(frame, 
                   text="errase", 
                   fg="yellow",
                   command=show3)
button.pack(side=tk.LEFT)


ax1 = fig.add_subplot(1, 1, 1,xlim=(xmin, xmax), ylim=(ymin[0] , ymax[0]))
ax1.title.set_text('First Plot')
ax1.set_ylabel("Volts1")
ax1.grid(color='k')
ax1.set_facecolor('c')


    
anim = animation.FuncAnimation(fig,getSerialData, fargs=(Samples,numData,serialConnection,lines), interval=sampleTime)
plt.show()

serialConnection.close() # cerrar puerto serial/ close serial port
 
