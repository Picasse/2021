close all;clear all
%1) Realice la simulación del proceso de muestreo de la señal análoga
% Señal de tiempo continuo
t=0:0.001:2;%Dos segundos de tiempo señal analoga
f=1/2;   %Periodo Varible de 0.01segundos(100Hz) a 2 segundos(0.5Hz)
xt=2.5+2.5*sin(2*pi*f*t); %Señal analoga
% Discretización de la señal análoga
Ts=1/10; % Periodo de muestreo 10 muestras/s 0.1segundos
Fs=1/Ts;% Frecuencia de muestreo 10 muestras/s
nTs=0:Ts:1.9;%Si es 2 toma 21 datos, si es 1.9 toma 24
xnTs=2.5+2.5*sin(2*pi*f*nTs);
%Mostrando en pantalla
figure('Name','Señal análoga y señal discretizada')
plot(t,xt);
hold on;grid on 
stem(nTs,xnTs);
hold off
%cuantificando la señal de tiempo discreto
ran=max(xt)-min(xt);%rango de la señal
nbits=12;%bits de cuantificacion
nnivs=(2^nbits)-1;%numero de niveles de cuantificacion
delta=ran/nnivs;%altura de nivel
nive=min(xt):delta:max(xt);
nivem=nive+delta/2;
[~,N]=size(nTs);
xnq=zeros(1,N);
for i=1:N
j=1;
while xnTs(i)>nivem(j)
j=j+1;
end
xnq(i)=nive(j);
end
figure('Name','Señal discretizada y señal cuantificada')
stem(nTs,xnq)
hold on
stem(nTs,xnTs)
hold off
%error de cuantificacion
err=xnTs-xnq;
figure('Name','Error de cuantificacion')
stem(nTs,err);
meadia_err=mean(err);
desv_err=std(err)
%-----------------------------------------------------------------------------------------------------------------------
%Lectura archivo csv
filename = 'p1_5.csv';
data = importdata(filename);%Leemos archivo csv
eje_x = data(:,1);%Guardamos numero de muestra en un vector
eje_y = data(:,2);%Guardamos las muestras voltaje digitalizadas en un vector
eje_y1=transpose(eje_y);%Hacemos la transpuesta filas a col
% eje_y1=eje_y1/819;%reescalamos la señal digitalizada a voltaje
figure('Name','Señal STM')
stem(eje_x,eje_y1);%Graficamos Señal Digitalizada
%-----------------------------------------------------------------------------------------------------------------------
%Hallar el desfase entre la muestra y la señal simulada
%fuente: https://la.mathworks.com/matlabcentral/answers/258773-how-to-calculate-phase-angle-between-two-sine-wave-from-vectors
y_rad=acos(dot(xnTs,eje_y1)/(norm(xnTs)*norm(eje_y1)))
% y_deg=y_rad*360/(2*pi)
%Correguir el desfase ajustando la señal simulada
xnTsCorreguido=2.5+2.5*sin(2*pi*f*nTs+y_rad);
xnTsCuantificado=round(xnTsCorreguido*819);%Cuantifica a 12 bits
figure('Name','Señal Simulada Correguida')
stem(nTs,xnTsCorreguido);
%Hallar el PSNR entre muestra y simulacion de la muestra %fuente: https://la.mathworks.com/help/images/ref/psnr.html
[peaksnr, snr] = psnr(eje_y1, xnTsCuantificado);    
fprintf('\n The Peak-SNR value is %0.4f', peaksnr);



