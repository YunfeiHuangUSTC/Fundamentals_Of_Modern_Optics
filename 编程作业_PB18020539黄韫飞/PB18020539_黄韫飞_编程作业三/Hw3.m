%Holography Simulation(GS Algorithm)
clear,clc,clf
rng(1)
Figure=im2double(imread('USTC.jpeg'));
Target(:,:)=Figure(:,:,1);
z=400;lambda=0.6328;tolerance=0.94;stepxy=0.3;k=2*pi/lambda;ntarget=500;
Target=imresize(Target,ntarget/length(Target));
x=(-ntarget/2):stepxy:(ntarget/2);y=(-ntarget/2):stepxy:(ntarget/2);
nscreen=length(x);
Target=imresize(Target,nscreen/ntarget);
[xx,yy]=meshgrid(x,y);
r=sqrt(xx.^2+yy.^2);
Amp=zeros(nscreen,nscreen);
Amp(r<300)=1;
phase0=2*pi*rand(nscreen,nscreen);screen=Amp.*exp(1i*phase0);
% U=RSDiff(z,x,k,screen);
U=fft2(screen);
correlate=ErrorCriterion(abs(U).^2,Target);
fprintf('n\t correlate\n')
count=1;
fprintf('%d\t %f\n',count,correlate);
while correlate<tolerance && count<=200
    A=sqrt(Target).*exp(1i*angle(U));
%     B=RSDiff(-z,x,-k,A);
B=ifft2(A);
    C=Amp.*exp(1i*angle(B));
%     U=RSDiff(z,x,k,C);
U=fft2(C);
    count=count+1;
    correlate=ErrorCriterion(abs(U).^2,Target);
    fprintf('%d\t %f\n',count,correlate);
end
imagesc(0:nscreen*stepxy,0:nscreen*stepxy,abs(U).^2)
axis square
figure;
imagesc(0:nscreen*stepxy,0:nscreen*stepxy,angle(B));colorbar;axis square