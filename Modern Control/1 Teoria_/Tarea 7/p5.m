clear

%PID DISCRETO DISCRETO
syms z s0 s1 s2 r0

ts = 5; %Tiempo de establecimiento
tm = ts/40;
zita = 0.9;
wn = 4/(zita*ts);
% ft=tf([7.05045],[1 8.508 6.515])
num =[116400];
den = [1.0000    0.4899    25];
Gs = tf(num, den)
Gd = c2d(Gs, tm, 'zoh')
gdzn = Gd.num{1}
gdzd = Gd.den{1}

[A, B] = tfdata(Gd, 'v');
A = poly2sym(A, z);
B = poly2sym(B, z);

S = [s0 s1 s2];
S = poly2sym(S, z);

%Filtro
filtro = z^1 + r0;
R = expand((z-1)^1*filtro);

%Polinomio característico
Pc = B*R+A*S;
ViewPc = vpa(collect(Pc),5)
Pc = expand(Pc);
Pc = coeffs(Pc, z);
Pc = fliplr(Pc);
Pc = vpa(Pc, 5);

%Constantes polinomio deseado
P1 = -2*exp(-zita*wn*tm)*cos(wn*tm*sqrt(1-zita^2));
P2 = exp(-2*zita*wn*tm);
alfa = -0.1;

%Polo no dominante
Pnd = (z+alfa)^2;%;


Pd = (z^2+P1*z+P2)*Pnd;
ViewPd = vpa(collect(Pd), 5)
Pd = vpa(expand(Pd));
Pd = coeffs(Pd, z);
Pd = fliplr(Pd);
eqn = Pc ==Pd;
[s0, s1, s2, r0] = solve(eqn, s0, s1, s2, r0);
s0 = double(vpa(s0))
s1 = double(vpa(s1))
s2 = double(vpa(s2))
r0 = double(vpa(r0))

%xd