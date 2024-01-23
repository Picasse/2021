% Generando se�al an�loga
t=0:0.001:1;
xt=2*cos(2*pi*3*t)+3*cos(2*pi*6*t);
%Discretizando se�al en tiempo
Ts=1/18;
Fs=1/Ts;
nTs=0:Ts:1;
xnTs=2*cos(2*pi*3*nTs)+3*cos(2*pi*6*nTs);
%Mostrando en pantalla
figure('Name','Se�al an�loga y se�al discretizada')
plot(t,xt);
hold on
stem(nTs,xnTs);
hold off
%cuantificando la se�al de tiempo discreto
ran=max(xt)-min(xt);%rango de la se�al
nbits=8;%bits de cuantificacion
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
figure('Name','Se�al discretizada y se�al cuantificada')
stem(nTs,xnq)
hold on
stem(nTs,xnTs)
hold off
%error de cuantificacion
err=xnTs-xnq;
figure('Name','Error de cuantificacion')
stem(nTs,err);
meadia_err=mean(err)
desv_err=std(err)
