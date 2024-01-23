import serial
import time
import collections
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
baudRate = 9600  # Baudios

try:
  serialConnection = serial.Serial(serialPort, baudRate) # Instanciar objeto Serial / Instance Serial Object
except:
  print('Cannot conect to the port')

Samples = 50  #Muestras / Samples
sampleTime = 200  #Tiempo de muestreo / Sample Time
numData = 3


# Limites de los ejes / Axis limit
xmin = 0
xmax = Samples
ymin = [0, 0 , 0 ,0]
ymax = [6, 6 , 6 , 100]
lines = []
data = []

for i in range(numData):
    data.append(collections.deque([0] * Samples, maxlen=Samples))
    lines.append(Line2D([], [], color='blue'))
  
fig = plt.figure()# Crea una nueva figura #Create a new figure.
ax1 = fig.add_subplot(2, 2, 1,xlim=(xmin, xmax), ylim=(ymin[0] , ymax[0]))
ax1.title.set_text('First Plot')
ax1.set_xlabel("Samples")
ax1.set_ylabel("Volts1")
ax1.add_line(lines[0])

ax2 = fig.add_subplot(2, 2, 2,xlim=(xmin, xmax), ylim=(ymin[1] , ymax[1]))
ax2.title.set_text('Second Plot')
ax2.set_xlabel("Samples")
ax2.set_ylabel("Volts2")
ax2.add_line(lines[1])

ax3 = fig.add_subplot(2, 2, 3,xlim=(xmin, xmax), ylim=(ymin[2] , ymax[2]))
#ax3.title.set_text('Third Plot')
ax3.set_xlabel("Samples")
ax3.set_ylabel("Volte3")
ax3.add_line(lines[2])




    
anim = animation.FuncAnimation(fig,getSerialData, fargs=(Samples,numData,serialConnection,lines), interval=sampleTime)
plt.show()

serialConnection.close() # cerrar puerto serial/ close serial port
 
