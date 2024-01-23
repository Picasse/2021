syms s qit ch cl th tl rhl rla th tl ta;
ch=10; cl=20; rhl=100; rla=200;
thp=(  qit-(th-tl)/rhl  )/ch;
tlp=(   (th-tl)/(rhl)-(tl-ta)/(rla)      )/cl;
x=[th,tl]; %VECTOR DE ESTADOS
y=[qit]; %Vector de entradas 
A=jacobian([thp;tlp],x)
B=jacobian([thp;tlp],qit)
y1=tl;
C=jacobian(y1,x)
D=jacobian(y1,qit)
SI=s*eye(2);
ftgeneral=C*inv(SI-A)*B+D;
ftgeneral=collect(simplify(ftgeneral));%Funcion de transferencia sin reemplazar
pretty(ftgeneral);
step([200],[4000000 7000 1]);