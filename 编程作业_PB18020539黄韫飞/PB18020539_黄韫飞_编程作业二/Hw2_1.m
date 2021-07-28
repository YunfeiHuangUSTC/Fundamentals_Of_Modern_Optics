%Spread Through Lens
%imaging at M=1,2 and 6 of a figure through a lens,f=100um, D=420um.
clear,clc,clf
%define parameters
f=100;D=420;lambda=0.633;k=2*pi/lambda;
%input a self-drawn picture(heart)
xymin=-D/2;xymax=D/2;stepxy=0.5;
x=xymin:stepxy:xymax;
object=imread('object.bmp');
object=object(:,:,1);
nobj=length(object);
nscr=length(x);
screen=zeros(nscr,nscr);
screen((nscr-nobj)/2+1:(nscr+nobj)/2,(nscr-nobj)/2+1:(nscr+nobj)/2)=object;
imagesc(0:nscr*stepxy,0:nscr*stepxy,screen);colorbar;
for M=[1,2,6]
    figure;
    U=ImageRS(screen,f,x,M,k);
    imagesc(0:nscr*stepxy,0:nscr*stepxy,abs(U));colorbar;
end