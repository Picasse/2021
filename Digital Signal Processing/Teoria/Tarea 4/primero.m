%señales discretas
n=-3:5;
y=[0 0 0 0 1 -0.5 0.25 0 0];
x=[0 0 0 0 -1 1 -0.5 0.5 0];
stem(n,x,'filled');
w=conv(y,x)


