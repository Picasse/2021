% [R,I]=meshgrid(-2:0.05:2,-2:0.05:2);
% Z=R+i*I;
% G=abs((  1-(0.5.*Z.^-1)+(0.25.*Z.^-2)  )./(Z.^2));%primera ft
% figure()
% meshc(R,I,G)


[R,I]=meshgrid(-2:0.05:2,-2:0.05:2);
Z=R+i*I;
G=abs((  (0.5*Z.^2)+(0.1.*Z)  )./(  (Z.^2)+0.1*Z-0.2    ));%segunda ft
figure()
meshc(R,I,G)