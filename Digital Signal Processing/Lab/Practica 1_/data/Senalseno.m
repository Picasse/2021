%Lectura archivo csv
filename = 'muestras.csv';
data = csvread(filename);
eje_x = data(:,1);
eje_y = data(:,2);

t=0:0.001:10;
f = 0.5;
xt=(1.65*sin(2*pi*f*t))+1.65;
figure,
plot(t,xt)
hold on

% Discretizacion de la señal analoga
Ts=1/10; % Periodo de muestreo
nT=0:Ts:9.9;
xnT =(1.65*sin(2*pi*f*nT)+1.65);
stem(nT,xnT)

Error = sum(eje_y - xnT')/100
std(eje_y - xnT')

hold off
figure,
plot(eje_x, eje_y)
hold on
stem(eje_x, eje_y)

hold off
figure,
plot(t,xt)
hold on
plot(eje_x, eje_y)

ref = imread('simulacion.tif'); 
A = imnoise(ref,'salt & pepper', 0.02);
[peaksnr, snr] = psnr(A, ref)    
fprintf('\n The Peak-SNR value is %0.4f', peaksnr)
err = immse(A, ref) %MSE 
fprintf('\n The mean-squared error is %0.4f\n', err);