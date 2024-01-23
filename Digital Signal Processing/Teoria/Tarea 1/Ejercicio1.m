% Señal de tiempo continuo
t=0:0.001:1;
%xt=2*cos(2*pi*2*t)+3*sin(2*pi*6*t); % 2 Hz y 6 Hz
xt=3*cos(2*pi*15*t)+4*sin(2*pi*25*t)-3*sin(2*pi*20*t); 
figure,
plot(t,xt)
hold on
% Discretización de la señal análoga
Ts=1/50; % Periodo de muestreo
Fs=1/Ts;
nT=0:Ts:1;
xnT=3*cos(2*pi*15*nT)+4*sin(2*pi*25*nT)-3*sin(2*pi*20*nT); 
% xnT=2*cos(2*pi*2*nT)+3*sin(2*pi*6*nT);
stem(nT,xnT)
hold off
N=Fs;
% Señal de tiempo discreto
n=0:N; % la variable de tiempo es discreta, valores enteros
xn=3*cos(2*pi*(15/Fs)*n)+4*sin(2*pi*(25/Fs)*n)-3*sin(2*pi*(20/Fs)*n);
figure,
stem(n,xn)