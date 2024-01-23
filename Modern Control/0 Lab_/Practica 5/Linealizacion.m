syms s  F l v vp t w wp time a wn g lo k m
time=0; a=0; wn=0; 
g=9.81; lo=0.5; k=100; m=1;
% tpp=(1/l)*(  -2*lp*tp -(a*wn*^2*sin(wn*time)-g)*sin(t)  +F*l )
% lpp=l*tp   -(k/m)*(l-lo)   -(  g-a*wn*^2*sin(wn*time)  )*cos(t)

wp=(1/l)*(  -2*v*w -(a*wn^2*sin(wn*time)-g)*sin(t)  +F*l );
vp=l*w   -(k/m)*(l-lo)   -(  g-a*wn^2*sin(wn*time)  )*cos(t);
tp=w;
lp=v;

Estados=[w,v,t,l]; %VECTOR DE ESTADOS
Entradas=[F]; %Vector de entradas 
A=jacobian([wp,vp,tp,lp],Estados)
Salida=t; %Salida teta
B=jacobian([wp,vp,tp,lp],Entradas)
C=jacobian(Salida,Estados)
D=jacobian(Salida,Entradas)
%PUNTOS DE OPERACION
w=0;v=0;
t=0.523599; %theta 30 grados 0.523599
wp=vpa(eval(wp),5)
vp=vpa(eval(vp),5)

l=vpa(solve(vp==0,l),5)

wp=vpa(eval(wp),5)
F=vpa(solve(wp==0,F),5)

A=vpa(eval(A),5);A=double(A)
B=vpa(eval(B),5);B=double(B)
C=vpa(eval(C),5);C=double(C)
D=vpa(eval(D),5);D=double(D)
ee=ss(A,B,C,D);
ft=tf(ee)
step(ft)

%Para escalon >:{v
Agorrito=[  A [0; 0; 0; 0]; -C 0  ]
Bgorrito=[   B;0  ]
cd=0.7;
ts=3;
wnd=4/(ts*cd)%Hallar omega
PD=[1     2*cd*wnd     wnd^2];
PD=conv([PD],[1 5*cd*wnd]) %el 1x10^3 multiplica a todo el vector
PD=conv([PD],[1 5*cd*wnd])
PD=conv([PD],[1 5*cd*wnd])

K=acker(Agorrito,Bgorrito,roots(PD)) %k1 k2 k3 k4 el ultimo es ki y se cambia el signo

%Para rampa <[:{v
Agorrito1=[  A zeros(4,1)  zeros(4,1) ;  zeros(1,4) 0 1; -C 0 0   ]
Bgorrito1=[   B;0;0  ]

PD1=[1     2*cd*wnd     wnd^2];
PD1=conv([PD1],[1 5*cd*wnd]) %el 1x10^3 multiplica a todo el vector
PD1=conv([PD1],[1 5*cd*wnd])
PD1=conv([PD1],[1 5*cd*wnd])
PD1=conv([PD1],[1 5*cd*wnd])

K1=acker(Agorrito1,Bgorrito1,roots(PD1)) %k1 k2 k3 k4 el ultimo es ki ki2y se cambia el signo

%Para parabola /:v/
Agorrito2=[  A zeros(4,1)  zeros(4,1) zeros(4,1);  zeros(1,4) 0 1 0;zeros(1,4) 0 0 1 ; -C 0 0 0   ]
Bgorrito2=[   B;0;0;0  ]

PD2=[1     2*cd*wnd     wnd^2];
PD2=conv([PD2],[1 5*cd*wnd]) %el 1x10^3 multiplica a todo el vector
PD2=conv([PD2],[1 5*cd*wnd])
PD2=conv([PD2],[1 5*cd*wnd])
PD2=conv([PD2],[1 5*cd*wnd])
PD2=conv([PD2],[1 5*cd*wnd])

K2=acker(Agorrito2,Bgorrito2,roots(PD2)) %k1 k2 k3 k4 el ultimo es ki ki2y se cambia el signo

%OBSERVADORES

%Para escalon q:v
tso=ts/10;%tiempo de respuesta 10 veces mas rapido
wndo=4/(tso*cd)%Hallar omega
PDobs=[1     2*cd*wndo     wndo^2];
PDobs=conv([PDobs],[1 5*cd*wndo]);%el 1x10^3 multiplica a todo el vector
PDobs=conv([PDobs],[1 5*cd*wndo])
L1=acker(A',C',roots(PDobs))'

%Para rampa <[:{v
%same

%Para parabola /:v/
%same
