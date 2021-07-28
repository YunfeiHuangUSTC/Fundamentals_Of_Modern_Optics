function U = ImageRS(screen,f,x,M,k)
%ImageRS returns the Amplitude of light on image plane
z1=f*(M+1)/M;z2=f*(M+1);
U1=RSDiff(z1,x,k,screen);
y=x;
[xx,yy]=meshgrid(x,y);
phi=exp(-1i*k*(xx.^2+yy.^2)/(2*f));
U2=U1.*phi;
U=RSDiff(z2,x,k,U2);
end