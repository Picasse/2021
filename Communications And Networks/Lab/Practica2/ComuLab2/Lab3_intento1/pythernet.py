from socket import *
import time
 
address= ( '10.1.15.243', 5000) #define server IP and port
client_socket =socket(AF_INET, SOCK_DGRAM) #Set up the Socket
client_socket.settimeout(1) #Only wait 1 second for a response
 
while(1):
 
    data = "Temperature" #Set data request to Temperature
 
    client_socket.sendto( data, address) #Send the data request
 
    try:
 
        rec_data, addr = client_socket.recvfrom(2048) #Read response from arduino
        temp = float(rec_data) #Convert string rec_data to float temp
        print ("The Measured Temperature is ", temp, " degrees F.") # Print the result

    except:
        pass
 
    time.sleep(2) #delay before sending next command
 
    data = "Pressure" #Set data request to Pressure
 
    client_socket.sendto( data, address) #Send the data request
 
    try:
 
        rec_data, addr = client_socket.recvfrom(2048) #Read response from arduino
        Pressure = float(rec_data) #Convert string rec_data to float temp
        print ("The Measured Pressure is ", Pressure, " Pa.") # Print the result
 
    except:
        pass
 
    time.sleep(2) #delay before sending next command
 
    print ("")
