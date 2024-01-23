close all
%Estimadores con sesgo y sin sesgo
m=1;
s=1;
N=4000;
P=3;
%Generando observaciones
% x=normrnd(m,sqrt(s),N,P);
% x=rand(N);
x=exprnd(m,N,P)
%Calculando estimador de media muestral
m_h=mean(x,2);
media=mean(m_h)
%Histograma de estimador de media muestral
figure('Name','Estimador de media muestral')
h1=histogram(m_h,50);
hold on
stem(mean(m_h),max(h1.Values))
hold off
%Estimador de varianza sesgado
s_b=var(x,1,2);
var_sesgo=mean(s_b)
%Histograma de varianza sesgado
figure('Name','Estimador de varianza sesgado')
h2=histogram(s_b,50);
hold on
stem(mean(s_b),max(h2.Values))
hold off
%Estimador de varianza insesgado
s_u=var(x,0,2);
var_unses=mean(s_u)
%Histograma de varianza sin sesgo
figure('Name','Estimador de varianza sin sesgo')
h3=histogram(s_u,50);
hold on
stem(mean(s_u),max(h3.Values))
hold off


