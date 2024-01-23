close all
clear all
%-----------------------------------------------------------------------------------------------------------------------
%1) Realice la simulación del proceso de muestreo de la señal análoga
%-----------------------------------------------------------------------------------------------------------------------
% Señal de tiempo continuo Nbits/Tiempito/Periodo/CSV  /escribir consola/Graficas
nbits=12;
tiempito=0.2539;
periodo=1.75;
t=0:0.001:2;%Dos segundos de tiempo señal analoga
f=1/periodo;   %Periodo Varible de 0.01segundos(100Hz) a 2 segundos(0.5Hz)
xt=((2^nbits-1)/2)+((2^nbits-1)/2)*sin(2*pi*f*t); %Señal analoga
% Discretización de la señal análoga
Ts=1/10; % Periodo de muestreo 10 muestras/s 0.1segundos
Fs=1/Ts;% Frecuencia de muestreo 10 muestras/s
nTs=tiempito:Ts:1.9+tiempito;%Si es 2 toma 21 datos, si es 1.9 toma 20
xnTs=((2^nbits-1)/2)+((2^nbits-1)/2)*sin(2*pi*f*nTs);
xnTs=round(xnTs);
vector=1:1:20;
%Mostrando en pantalla
figure('Name','Señal análoga y señal discretizada')
xlabel('Muestras')
ylabel('bits')
% plot(nTs,xnTs);
hold on;grid on 
stem(vector,xnTs);
% hold off
%-----------------------------------------------------------------------------------------------------------------------
%%%%%%%%%%%%%%Lectura archivo csv%%%%%%%%%%%%%%%%%%
%-----------------------------------------------------------------------------------------------------------------------
% filename = 'periodo 2.csv';
M=table2array(readtable('periodo 1.75.csv'));
% data = importdata(filename);%Leemos archivo csv
eje_x = M(:,1);%Guardamos numero de muestra en un vector
eje_y = M(:,2);%Guardamos las muestras voltaje digitalizadas en un vector
eje_y1=transpose(eje_y);%Hacemos la transpuesta filas a col
figure('Name','Señal STM')

stem(eje_x,eje_y1);%Graficamos Señal Digitalizada y Cuantificada
xlabel(' Muestras')
ylabel(' bits')
%-----------------------------------------------------------------------------------------------------------------------
%%%%%%%Hallar el desfase entre las señales, correguir la simulada y cuantificarla%%%%%
%-----------------------------------------------------------------------------------------------------------------------
%fuente: https://la.mathworks.com/matlabcentral/answers/258773-how-to-calculate-phase-angle-between-two-sine-wave-from-vectors
% y_rad=acos(dot(xnTsCuantificado,eje_y1)/(norm(xnTsCuantificado)*norm(eje_y1)));
% y_deg=y_rad*360/(2*pi)
%Correguir el desfase ajustando la señal simulada
% xnTsCorreguido=2.5+2.5*sin(2*pi*f*nTs+y_rad);
% xnTsCorreguido=round(xnTsCorreguido*(2^nbits-1)/5);%Cuantifica a 12 bits
% figure('Name','Señal Simulada correguida en fase y cuantificada en 12bits')
% stem(nTs,xnTsCorreguido);
% stem(eje_x,xnTsCorreguido);
%-----------------------------------------------------------------------------------------------------------------------
%%%%%%%%%%%%%%Hallar PSNR entre SIMULADA Y DIGITALIZADA ya en fase%%%%
%-----------------------------------------------------------------------------------------------------------------------
%Hallar el PSNR entre muestra y simulacion de la muestra 
%fuente: https://la.mathworks.com/help/images/ref/psnr.html
[peaksnr, snr] = psnr(eje_y1, xnTs)
fprintf('\n The Peak-SNR value is %0.4f', abs(peaksnr));

%-----------------------------------------------------------------------------------------------------------------------
%%%%%%%%%%%%%%Hallar Error Cuadratico Medio MSE%%%%%%%%%%%%%%%%
%-----------------------------------------------------------------------------------------------------------------------
%fuente: https://la.mathworks.com/help/images/ref/immse.html
MSE = immse(eje_y1, xnTs);
fprintf('\n The mean-squared error is %0.4f\n', min(MSE));
%-----------------------------------------------------------------------------------------------------------------------
%%%%%%%%%%%%%%Hallar Error De Cuantificacion %%%%%%%%%%%%%%%
%-----------------------------------------------------------------------------------------------------------------------
%cuantificando la señal de tiempo discreto
ran=max(eje_y1)-min(eje_y1);%rango de la señal
nnivs=(2^nbits)-1;%numero de niveles de cuantificacion
delta=ran/nnivs;%altura de nivel
nive=min(eje_y1):delta:max(eje_y1);
nivem=nive+delta/2;
[~,N]=size(nTs);
xnq=zeros(1,N);
for i=1:N
j=1;
while eje_y1(i)>nivem(j)
j=j+1;
end
xnq(i)=nive(j);
end
% figure('Name','Señal discretizada y señal cuantificada')
% stem(nTs,xnq)
% hold on
% stem(nTs,xnTs)
% hold off
%error de cuantificacion
err=eje_y1-xnq;
figure('Name','Error de cuantificacion')
stem(vector,err);
xlabel('Muestras')
ylabel('Error de cuantificacion')

%-----------------------------------------------------------------------------------------------------------------------
%%%%%%%%%%%%%%Media y Varianza %%%%%%%%%%%%%%%
%-----------------------------------------------------------------------------------------------------------------------
%Media fuente:https://la.mathworks.com/help/matlab/ref/mean.html?searchHighlight=mean&s_tid=srchtitle
%Varianza fuente:https://la.mathworks.com/help/matlab/ref/var.html
Media = mean(err);
fprintf('La media del error es: %0.4f\n', Media);
Varianza=var(err);
fprintf('La varianza del error es: %0.4f\n', Varianza);


% 
% eje_y(1)
% time=(    asin( (eje_y(1)-(2^nbits-1)/2)/((2^nbits-1)/2) )    )/(2*pi*f)
% v1=((2^nbits-1)/2)+((2^nbits-1)/2)*sin(2*pi*f*time);
% v2=((2^nbits-1)/2)+((2^nbits-1)/2)*sin(2*pi*f*time+0.01);
% if(eje_y(2)>eje_y(1)&&(v2>v1))%si la STM crece
%     
% end
