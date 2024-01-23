nbits=12;
T=1.75;
f=1/T;%Periodo Varible de 0.01segundos(100Hz) a 2 segundos(0.5Hz)
Ts=1/10; % Periodo de muestreo 10 muestras/s 0.1segundos
Fs=1/Ts;% Frecuencia de muestreo 10 muestras/s
%-----------------------------------------------------------------------------------------------------------------------
%%%%%%%%%%%%%%Lectura archivo csv%%%%%%%%%%%%%%%%%%
%-----------------------------------------------------------------------------------------------------------------------

% filename = 'periodo 2.csv';
M=table2array(readtable('periodo 1.75.csv'));
% data = importdata(filename);%Leemos archivo csv
eje_x = M(:,1);%Guardamos numero de muestra en un vector
eje_y = M(:,2);%Guardamos las muestras voltaje digitalizadas en un vector
eje_y1=transpose(eje_y);%Hacemos la transpuesta filas a col
% eje_y1=eje_y1/819;%reescalamos la se�al digitalizada a voltaje
figure('Name','Se�al STM')
stem(eje_x,eje_y1);%Graficamos Se�al Digitalizada y Cuantificada

eje_y(1)
time=(    asin( (eje_y(1)-(2^nbits-1)/2)/((2^nbits-1)/2) )    )/(2*pi*f)
v1=((2^nbits-1)/2)+((2^nbits-1)/2)*sin(2*pi*f*time);
v2=((2^nbits-1)/2)+((2^nbits-1)/2)*sin(2*pi*f*time+0.01);
if(eje_y(2)>eje_y(1)&&(v2>v1))%si la STM crece
    t=time:0.001:2+time;%Dos segundos de tiempo se�al analoga
    nTs=time:Ts:time*20;%Si es 2 toma 21 datos, si es 1.9 toma 20
end


%-----------------------------------------------------------------------------------------------------------------------
%1) Realice la simulaci�n del proceso de muestreo de la se�al an�loga
%-----------------------------------------------------------------------------------------------------------------------
% Se�al de tiempo continuo


xt=((2^nbits-1)/2)+((2^nbits-1)/2)*sin(2*pi*f*t); %Se�al analoga



xnTs=((2^nbits-1)/2)+((2^nbits-1)/2)*sin(2*pi*f*nTs);% Discretizaci�n de la se�al an�loga
%Mostrando en pantalla
% figure('Name','Se�al an�loga y se�al discretizada')
% plot(t,xt);
% hold on;grid on 
% stem(nTs,xnTs);
% hold off












