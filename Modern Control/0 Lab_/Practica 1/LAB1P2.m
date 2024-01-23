syms j1 j2 ja jb r1 r2 ra rb k1 k2 b1 b2 Ta w1 w2 wa t1 t2 ta s;
TL=5*w2*abs(w2);
w1p=(Ta-b1*w1-k1*(t1-ta) )/j1;
w2p=(k2*(ta*ra/rb-t2) - b2*t2-TL )/j2;
wap=(rb*rb*k1/(ja*rb*rb+jb*ra*ra)   )*(t1-ta);
t1p=w1;
t2p=w2;
tap=wa;
x=[w1,w2,wa,t1,t2,ta]; %vector de estados
A=jacobian([w1p; w2p; wap; t1p; t2p; tap],x);
B=jacobian([w1p; w2p; wap; t1p; t2p; tap],Ta);
y=w1;
C=jacobian(y,x);
D=jacobian(y,Ta);
SI=s*eye(6);
ftgeneral=C*inv(SI-A)*B+D;
ftgeneral=collect(simplify(ftgeneral));%Funcion de transferencia sin reemplazar
pretty(ftgeneral);
j1=0.625; j2=1.08; ja=0.135; jb=0.04; r1=0.5; r2=0.6; ra=0.3; rb=0.2; k1=100; k2=250; b1=10; b2=15; w2=0; %Constantes
% w1=10; t1=720; ta=700;%Puntos de operacion

ftevaluada=eval(ftgeneral);%Funcion de transferencia con reemplazos
pretty(ftevaluada);
ftstep=tf([9/1000 0 4],[9/1600 9/100 17/5 40]);%Ftevluada copiada
step(ftstep);
