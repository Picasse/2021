syms s K1 K2 M B R L N v x a ei corriente;
K1 =100;K2=150; M=10; B=10; R=1000; L=1; N=50; a=2;
alfa=2*3.14*a*N*B;
xp=v;
vp=( -(K1+K2)*x-B*v+alfa*corriente      )/M;
ip=(   -alfa*v-R*corriente+ei    )/L;
Estados=[x,v,corriente]; %VECTOR DE ESTADOS
Entradas=[ei]; %Vector de entradas 
A=jacobian([xp,vp,ip],Estados)
y1=x; %este y1=q5;
B=jacobian([xp,vp,ip],ei)
C=jacobian(y1,Estados)
D=jacobian(y1,ei)
SI=s*eye(3);
ftgeneral=C*inv(SI-A)*B+D;
ftgeneral=collect(simplify(ftgeneral));%Funcion de transferencia sin reemplazar
pretty(ftgeneral);
% step(ftgeneral); se puteaaaaaaaaaaaaaaaaaaaaaaaa
step([628.3],[1 1001 1257662.06 25000])


