%Homework1 Rayleigh-Sommerfeld Diffraction or Angular Spectrum Diffraction
%Homework1_1 Hole d=10 (¦Ìm), z=0.1~100 ¦Ìm

clear,clc,clf
%parameter of device(unit:micron)
lambda=0.633;k=2*pi/lambda;
stepx=0.1;stepz=0.1;%step means each pixel in the result fig
xymin=-20;xymax=20;zmin=0.1;zmax=100;
imagexyrange=20;nxyimage=imagexyrange/stepx;
x=xymin:stepx:xymax;y=x;
diameter=10; radius=diameter/2;
[x0,y0]=meshgrid(x,y);
r=sqrt(x0.^2+y0.^2);
n1=length(x);
n2=(zmax-zmin)/stepz+1;
object=zeros(n1,n1);
object(r<radius)=1;

I=zeros(n1,n1,n2);
i=0;
for z=zmin:stepz:zmax
    i=i+1;
    U=RaySomDiff(z,k,x0,y0,object);
    I(:,:,i)=abs(U).^2;
end

slice(:,:)=I((n1-1)/2,:,:);
imagesc(0:10:zmax,-imagexyrange/2:5:imagexyrange/2,slice((n1-nxyimage+1)/2:(n1+nxyimage+1)/2,:));
colorbar;