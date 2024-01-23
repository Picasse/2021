import serial

arduinoPuerto = "COM7"
baudRate = 9600
nombreCSV = "prueba.csv"
samples = 500
print_labels = False

comunicacionSerial = serial.Serial(arduinoPuerto, baudRate)
print("Conectado al puerto serial:" + arduinoPuerto)
archivo = open(nombreCSV, "w")
print("Archivo creado")

line = 0

while line <= samples:
    if print_labels:
        if line == 0:
            print("Priting Column Headers")
        else:
            print("Line"+str(line)+": writing...")

    getData = comunicacionSerial.read()
    data = getData[0]
    value_s = (int((data/0.757575757575)*100))
    print(value_s/10000)

    file = open(nombreCSV, "a")

    file.write(str(value_s/10000) + "\n")
    line = line+1

print("Data collection complete!")
file.close()
