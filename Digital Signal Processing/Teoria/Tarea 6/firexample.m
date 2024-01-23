function []=firexample()

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

%enventanado
%frec corte = 1/32
h1n=fir1(50,1/16);
y1n=filter(h1n,1,xn);
y1k=abs(fft(y1n));
figure(2);
freqz(h1n,1);

figure()
subplot(2,1,1)
stem(n,y1n);
title('Señal filtrada con FIR1');
subplot(2,1,2);
stem(k,y1k);
title('Espectro de frecuencia');

pause

%muestreo en frecuencia
%frec corte = 1/32
R=63;
E=4;
F=[0:R]/R;
A=[ones(1,E),zeros(1,R-E+1)];
h2n=fir2(50,F,A);
y2n=filter(h2n,1,xn);
y2k=abs(fft(y2n));
figure(2);
freqz(h2n,1);

figure()
subplot(2,1,1);
stem(n,y2n);
title('Señal filtrada con FIR2');
subplot(2,1,2);
stem(k,y2k);
title('Espectro de frecuencia');

pause

%Parks-McClellan

R=63;
E=4;
F=[0:R]/R;
A=[ones(1,E),zeros(1,R-E+1)];
h3n=firpm(50,F,A);
y3n=filter(h3n,1,xn);
y3k=abs(fft(y3n));
figure(2);
freqz(h3n,1);

figure()
subplot(2,1,1)
stem(n,y3n);
title('Señal filtrada con FIRPM');
subplot(2,1,2);
stem(k,y3k);
title('Espectro de frecuencia');