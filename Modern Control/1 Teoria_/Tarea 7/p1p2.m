% syms sd tm si kd kp ki1 ki2 z k ti td N
% sd=(z-1)/(tm*z)%euler atras
% si=( 2*(z-1) )/( tm*(z+1) )%tustin
% num=kd*sd^3+kp*sd^2+ki1*sd+ki2
% den=si^2
% gc=collect(num/den,z)%punto1
% 
% gc1=collect(    k*( 1 +1/(ti*sd) +(td*sd)/(1+td*sd/N) )    ,z) %punto 2

%3ro  u=temperatura agua x1=concentracion x2=temp reactor
syms s x1 x2 u F co To Cp V b a h
%constantes 
% F=2000; co=0.5; To=5325; Cp=0.75; V=2410; b=15070; a=7.09e10; h=15050;
x1p=(F/V)*(co-x1)-a*x1*exp(-b/x2)
x2p=(F/V)*(To-x2)+((a*V)/Cp)*x1*exp(-b/x2) -( h/(V*Cp) )*(x2-u)
Ec=[x1p,x2p];
Est=[x1,x2];
Ent=u;
A=jacobian(Ec,Est)
B=jacobian(Ec,Ent)
Sal=x2;
C=jacobian(Sal,Est)
D=jacobian(Sal,Ent)
ft5=C*inv(s*eye(2)-A)*B+D
%puntos operacion
x1=0.49%tiene que ser menor a 0.5 y mayor a 0 o se putea durisimo
x2=solve((F/V)*(co-x1)-a*x1*exp(-b/x2)==0,x2);
x2=vpa(x2,5)
u=solve((F/V)*(To-x2)+((a*V)/Cp)*x1*exp(-b/x2) -( h/(V*Cp) )*(x2-u)==0,u)

A=eval(A);
A=double(A)
B=eval(B);
B=double(B)
C=eval(C);
C=double(C)
D=double(D)
% ft5=vpa(collect(C*inv(s*eye(2)-A)*B+D,s),5)
ee4=ss(A,B,C,D)
ft4=tf(ee4)
% num4 = ft5.num{1}

%xd













