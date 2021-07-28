%Homework1 Rayleigh-Sommerfeld Diffraction or Angular Spectrum Diffraction
%Homework1_2 Hole d=100 (¦Ìm), z=30~70 ¦Ìm

clear,clc,clf
%parameter of device(unit:micron)
lambda=0.633;k=2*pi/lambda;f=50;
stepx=0.1;stepz=0.1;%step means each pixel in the result fig
xymin=-50;xymax=50;zmin=30;zmax=70;
x=xymin:stepx:xymax;y=x;
diameter=100; radius=diameter/2;
[x0,y0]=meshgrid(x,y);
r=sqrt(x0.^2+y0.^2);
n1=length(x);
n2=(zmax-zmin)/stepz+1;
object=zeros(n1,n1);
object(r<radius)=1;
phase=exp(-1i*k*r.^2/(2*f));
object=object.*phase;

I=zeros(n1,n1,n2);
i=0;
for z=zmin:stepz:zmax
    i=i+1;
    U=RaySomDiff(z,k,x0,y0,object);
    I(:,:,i)=abs(U).^2;
end

slice(:,:)=I((n1+1)/2,:,:);
imagesc(zmin:10:zmax,xymin:10:xymax,slice);
colorbar;