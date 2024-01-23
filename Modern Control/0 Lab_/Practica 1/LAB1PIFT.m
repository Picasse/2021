syms s X1 X2 X3 m1 m2 b1 b2 k1 k2 k3 k4;
a=-m1*s^2-k1-2*b1*s;
b=2*b1*s;
c=-m2*s^2-2*b2*s-k2-k1;
d=2*b2*s+k2;
e=-2*b1*s-2*b2*s-k2*s-2*k4*sin(45);
f=2*b2*s+k2*s;
g=2*b1*s;

ec3=X3*e+X2*f+X1*g;
X3=solve(ec3,X3);
ec1=X1*a+X3*b+X2*k1;
ec2=X2*c+X1*k1+X3*d;



