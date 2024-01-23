%1) Realice la simulación del proceso de muestreo de la señal análoga
% Señal de tiempo continuo
t=0:0.001:2;%Dos segundos de tiempo señal analoga
f=1/0.5;   %Periodo Varible de 0.01segundos(100Hz) a 2 segundos(0.5Hz)
xn=2.5+2.5*sin(2*pi*f*t); % 2 Hz y 6 Hz
figure('Name','Señal analoga y discretizada')
plot(t,xn)%Señal analoga
% xlabel('Tiempo')
% ylabel('Voltaje')
hold on
grid on 
% Discretización de la señal análoga
Ts=1/10; % Periodo de muestreo 10 muestras/s 0.1segundos
Fs=1/Ts;% Frecuencia de muestreo 10 muestras/s
nT=0:Ts:2;
xnT=2.5+2.5*sin(2*pi*f*nT);
% figure('Name','Señal discreta')%Comentariar para mostrar en misma grafica
stem(nT,xnT)
xlabel('Muestras Simulado')
ylabel('Voltaje Simulado')
hold off
% 
% x=M0_5*5/4096;
% y=V0_5;
% plot(x,y,'--')
% xlabel('Muestras STM periodo 0.5 segundos')
% ylabel('Voltaje STM')
% hold off

