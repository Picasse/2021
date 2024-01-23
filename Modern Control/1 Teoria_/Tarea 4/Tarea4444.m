clear
%% FORMA CANÓNICA CONTROLABLE

num = [0 0 0 -626];
den = [1 100 -97.97 -9797];

ft = tf(num, den)

%%Forma canónica controlable de la forma 2

[A,B,C,D] = tf2ss(num, den);

%%Forma canónica controlable de la forma 1
%Matríz de transformación:
%T = [0 1; 1 0];
% en caso de ser 3x3 :
%T = [0 0 1; 0 1 0; 1 0 0];
%[A,B,C,D] = ss2ss(A,B,C,D,T)

Pc = ctrb(A, B)
DetPc = det(Pc)

%% FORMA CANONICA OBSERVABLE
 
Po = obsv(A, C)
DetPo = det(Po)

[num1, den1]= ss2tf(A, B, C, D)
Gs = tf(num1, den1)

%% Determinante

PDE = poly([-40.0000; -4.0000 + 5.4575i; -4.0000 - 5.4575i]) % a partir de las raices se genera el polinomio deseado;

syms k1E k2E k3E s

KE=[k1E k2E k3E] %constantes del regulador

ISE=eye(3)*s

%Polinomio caracteristico
PCE=collect(det(ISE-(A-B*KE))) %Formula para el regulador (igualacionde polos)[Polinomio característico]
PCE=fliplr(coeffs(PCE,s))

%Iguala polinomio deseado:
k1E=solve(PCE(2)==PDE(2)); 
k1E=double(k1E);
k2E=solve(PCE(3)==PDE(3));
k3E=solve(PCE(4)==PDE(4));
k2E=eval(k2E);
k3E=eval(k3E);

KPE=[k1E k2E k3E]

KE1 = place(A, B, roots(PDE))
KE2 = acker(A, B, roots(PDE))