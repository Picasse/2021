r = 1;
xc = 0;
yc = 0;

theta = linspace(0,2*pi);
x = r*cos(theta) + xc;
y = r*sin(theta) + yc;
plot(x,y)
axis equal
grid on
hold on
x1=[0.5,0.4,-0.2,1,-2,1]
y1=[0.5,0.4,0.4,4,5,1]
scatter(x1,y1)