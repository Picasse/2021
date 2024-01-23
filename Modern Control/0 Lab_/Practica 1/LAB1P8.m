syms s h1 h2 h3 h4 R1 R2 R3 R4 R5 A1 A2 A3 A4 qi1 qi2 qi3;
R1=10; R2=11; R3=22; R4=50; R5=12; A1=5; A2=8; A3=7; A4=6;
q1=h1/R1;
q2=h1/R 2;
q3=h2/R3;
q4=(h3-h4)/R4;
q5=h4/R5;
h1p=(qi1-q1-q2)/A1;
h2p=(qi2-q3)/A2;
h3p=(qi3-q4+q2)/A3;
h4p=(q4-q5+q3)/A4;
x=[h1,h2,h3,h4]; %VECTOR DE ESTADOS
y=[qi1,qi2,qi3]; %Vector de entradas 
A=jacobian([h1p;h2p;h3p;h4p],x)
y1=h4; %SALIDA ALTURA 4
B=jacobian([h1p;h2p;h3p;h4p],y)
C=jacobian(y1,x)
D=jacobian(y1,y)
SI=s*eye(4);
ftgeneral=C*inv(SI-A)*B+D;
ftgeneral=collect(simplify(ftgeneral));%Funcion de transferencia sin reemplazar
pretty(ftgeneral);
 hold on
 step([120],[13860000 807500 11176 21])
 step([4200 12],[4435200 114256 682 1])
 step([12],[25200 506 1])
 legend({'qi1','qi2','qi3'},'Location','southeast')
