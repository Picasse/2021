import struct
import serial
import tkinter as tk
from tkinter import ttk
import matplotlib
import matplotlib.pyplot as plt
from matplotlib import style
import matplotlib.animation as animacion
from matplotlib.figure import Figure
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg, NavigationToolbar2Tk
matplotlib.use("TkAgg")
style.use("ggplot")
puerto = serial.Serial('COM2', 9600)
fig, (grafica1, grafica2, grafica3) = plt.subplots(3)
grafica1.set_title('Potenciometro 1')
grafica2.set_title('Potenciometro 2')
grafica3.set_title('Potenciometro 3')
for grafica in (grafica1, grafica2,grafica3):
    grafica.set(xlabel='tiempo(s)', ylabel='')
tiempo1 = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1]
tiempo2 = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1]
tiempo3 = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1]
tiempo4 = [tiempo1,tiempo2,tiempo3]
datos1 = []
datos2 = []
datos3 = []
datos4 = [datos1,datos2,datos3]
global bandera_btn
bandera_btn = 0
def actualizar(i):
    if bandera_btn == 1:
        puerto.write(b'%d' % bandera_btn)
        dato = float(puerto.read(10))
        grafica1.clear()
        if (len(datos1) < 11):
            datos1.append(float(dato))
            grafica1.plot(tiempo1[0:len(datos1)], datos1)
        else:
            for index in range(1,11):
                datos1[index-1] = datos1[index]
                tiempo1[index-1] = tiempo1[index]
            datos1[10] = dato
            tiempo1[10] = tiempo1[10] + 0.1
            grafica1.plot(tiempo1, datos1)
    elif bandera_btn == 2:
        puerto.write(b'%d' % bandera_btn)
        dato = float(puerto.read(10))
        grafica2.clear()
        if (len(datos2) < 11):
            datos2.append(float(dato))
            grafica2.plot(tiempo2[0:len(datos2)], datos2)
        else:
            for index in range(1, 11):
                datos2[index - 1] = datos2[index]
                tiempo2[index - 1] = tiempo2[index]
            datos2[10] = dato
            tiempo2[10] = tiempo2[10] + 0.1
            grafica2.plot(tiempo2, datos2)
    elif bandera_btn == 3:
        puerto.write(b'%d' % bandera_btn)
        dato = float(puerto.read(10))
        grafica3.clear()
        if (len(datos3) < 11):
            datos3.append(float(dato))
            grafica3.plot(tiempo2[0:len(datos3)], datos3)
        else:
            for index in range(1, 11):
                datos3[index - 1] = datos3[index]
                tiempo3[index - 1] = tiempo3[index]
            datos3[10] = dato
            tiempo3[10] = tiempo3[10] + 0.1
            grafica3.plot(tiempo3, datos3)
    elif bandera_btn == 4:
        puerto.write(b'%d' % bandera_btn)
        datos = puerto.readlines()
        for index, datos_actuales in enumerate(datos):
            (grafica1, grafica2, grafica3)[index].clear()
            if (len(datos4[index]) < 11):
                datos4[index].append(float(datos_actuales[0:4]))
                (grafica1, grafica2, grafica3)[index].plot(tiempo4[index][0:len(datos4[index])], datos4[index])
            else:
                for index_2 in range(1, 11):
                    datos4[index][index_2 - 1] = datos4[index][index_2]
                    tiempo4[index][index_2 - 1] = tiempo4[index][index_2]
                datos4[index][10] = float(datos_actuales[0:4])
                tiempo4[index][10] = tiempo4[index][10] + 0.1
                (grafica1, grafica2, grafica3)[index].plot(tiempo4[index], datos4[index])
class Interfaz(tk.Tk):
    def _init_(self, *args, **kwargs):
        tk.Tk._init_(self, *args, **kwargs)
        tk.Tk.wm_title(self, 'Laboratorio de comunicaciones')
        tk.Tk.wm_geometry(self, newGeometry="900x900")
        tk.Tk.configure(self, background="blue")
        container = tk.Frame(self)
        container.pack(side="top", fill="both", expand=True)
        container.grid_rowconfigure(0, weight=1)
        container.grid_columnconfigure(0, weight=1)
        self.frames = {}
        frame = Mgraficas(container, self)
        self.frames[Mgraficas] = frame
        frame.grid(row=0, column=0, sticky="nsew")
        self.show(Mgraficas)
    def show(self, cont):
        frame = self.frames[cont]
        frame.tkraise()
class Mgraficas(tk.Frame):
    def _init_(self, parent, controller):
        tk.Frame._init_(self,parent)
        Titulo = ttk.Label(self, text="Laboratorio 1 comunicaciones", font=('Comic Sans MS', 12))
        canvas = FigureCanvasTkAgg(fig, self)
        boton1 = ttk.Button(self, text="Gráfica 1", command=self.btn1)
        boton1.place(x=400,y=400)
        boton2 = ttk.Button(self, text="Gráfica 2", command=self.btn2)
        boton3 = ttk.Button(self, text="Gráfica 3", command=self.btn3)
        boton4 = ttk.Button(self, text="Gráficas", command=self.btn4)
        botonSalir = ttk.Button(self, text="Salir", command=quit)
        Titulo.pack()
        canvas.get_tk_widget().pack(side=tk.LEFT)
        boton1.pack(side=tk.RIGHT)
        boton2.pack(side=tk.RIGHT)
        boton3.pack(side=tk.RIGHT)
        boton4.pack(side=tk.RIGHT)
        botonSalir.pack(side=tk.BOTTOM)
    def btn1(self):
        global bandera_btn
        bandera_btn = 1
    def btn2(self):
        global bandera_btn
        bandera_btn = 2
    def btn3(self):
        global bandera_btn
        bandera_btn = 3
    def btn4(self):
        global bandera_btn
        bandera_btn = 4
k=Interfaz()
animacion = animacion.FuncAnimation(fig, actualizar, interval=500)
k.mainloop()
puerto.close()
