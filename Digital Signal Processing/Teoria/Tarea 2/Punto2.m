%Señal exponencial compleja
n= 0:9;
A=1+1i;
xn=A.^n;
figure('Name','Parte real')
stem(n,real(xn))
figure('Name','Parte imaginaria')
stem(n,imag(xn))
abs(A)
atan(0.5/0.5)