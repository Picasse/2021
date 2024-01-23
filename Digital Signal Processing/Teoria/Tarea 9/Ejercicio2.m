%Ejemplo Estimador de media muestral con mínimos cuadrados
A=4; % valor DC de la señal xn "desconocido"
N=100; % número de muestras de xn
xn=A+normrnd(0,1,N,1); % señal con ruido Gaussiano (media=0, sigma=1)
%Optimización por gradiente descendente
% punto de partida
A_h=xn(1);
%parametros de optimizacion
stop = 1;
step=0.1;
max_iter=500;
iter=0;
% loop de optimización
while stop > 0.00001 && iter<max_iter
A_hp=A_h;
err=-sum((xn-A_h))/N;
A_h=A_h-step*err;
stop = abs(A_h-A_hp);
iter = iter+1;
end
%Resultado final
A_h
error = abs(A-A_h)