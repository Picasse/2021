clear
syms s ia ra la kw r vin m v k b1 km x

iap = -(ra/la)*ia -kw*(v/(r*la)) + vin/la;
xp = v;
vp = -(k/m)*x -(b1/m)*xp+((r*km)/m)*ia;
est = [ia x v];
y = [vin];
A=jacobian([iap, xp, vp],est)
B=jacobian([iap, xp, vp],y)
C=jacobian(x,est)
D=jacobian(x,y)


SI=s*eye(3);
ftgeneral=C*inv(SI-A)*B+D;

ftgeneral=collect(simplify(ftgeneral));%Funcion de transferencia sin reemplazar
pretty(ftgeneral);

km = 0.05; r = 0.5; la = 0.05; m = 0.5; b1 = 0.5; ra = 1; k = 0.2; kw = 0.02;

A=eval(A)
B=eval(B)
C=eval(C)
D=eval(D)
ft=C*inv(SI-A)*B+D
ft=simplify(ft)
ee=ss(A,B,C,D)
ft=tf(ee)
%step(ft)