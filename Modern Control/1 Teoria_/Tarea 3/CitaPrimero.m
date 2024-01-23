syms c mp s w
% format float
% mp=exp(  -(c*pi)/(sqrt(  1-c^2 ))  )
b=10;
mp=0.05;
ts=1;
c=solve(exp(  -(c*pi)/(sqrt(  1-c^2 ))  )-mp==0,c)
c=abs(double(c))
ci=abs(c(2))
w=4/(ts*ci)
% DenPd=(s^2+2*ci*w*s+w^2)*(s+b*ci*w); collect(pol,s)
% DenPd=expand(DenPd)
% DenPd=vpa(DenPd,5)
% k=b*w*ci+2*ci*w;
% a=(   ci*(w^3)*b   )/(3*k);
% mi=k*a+3*k-1;
% 
% a=vpa(a,5)
% k=vpa(k,5)
% mi=vpa(mi,5)


