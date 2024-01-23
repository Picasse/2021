function []=iirexample()

n=0:511;%tiempo
k=n/512;%frecuencias
xn=sin(2*pi*n*1/4)+sin(2*pi*n*1/8)+sin(2*pi*n*1/32)+sin(2*pi*n*1/128);
xk=abs(fft(xn));

figure()
subplot(2,1,1);
stem(n,xn);
title('Señal de prueba x(n)');
subplot(2,1,2);
stem(k,xk);
title('Espectro de frecuencia');

pause

%Filtro Butterworth
%frec corte = 1/32
[b1,a1]=butter(3,1/16);
y1n=filter(b1,a1,xn);
y1k=abs(fft(y1n));
figure(2);
freqz(b1,a1);

figure()
subplot(2,1,1)
stem(n,y1n);
title('Señal filtrada');
subplot(2,1,2);
stem(k,y1k);
title('Espectro de frecuencia');

pause

%Filtro Chebyshev tipo 1
%frec corte = 1/32
[b2,a2]=cheby1(3,0.5,1/16);
y2n=filter(b2,a2,xn);
y2k=abs(fft(y2n));
figure(2);
freqz(b2,a2);

figure()
subplot(2,1,1);
stem(n,y2n);
title('Señal filtrada');
subplot(2,1,2);
stem(k,y2k);
title('Espectro de frecuencia');

pause

%Filtro Chebysev tipo 2
%frec corte = 1/32
[b3,a3]=cheby2(3,20,1/16);
y3n=filter(b3,a3,xn);
y3k=abs(fft(y3n));
figure(2);
freqz(b3,a3);

figure()
subplot(2,1,1)
stem(n,y3n);
title('Señal filtrada');
subplot(2,1,2);
stem(k,y3k);
title('Espectro de frecuencia');

pause

%Filtro Chebysev tipo 2
%frec corte = 1/32
[b4,a4]=ellip(3,0.5,20,1/16);
y4n=filter(b4,a4,xn);
y4k=abs(fft(y4n));
figure(2);
freqz(b4,a4);

figure()
subplot(2,1,1)
stem(n,y4n);
title('Señal filtrada');
subplot(2,1,2);
stem(k,y4k);
title('Espectro de frecuencia');