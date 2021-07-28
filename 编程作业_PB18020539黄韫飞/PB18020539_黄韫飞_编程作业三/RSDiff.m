function Out = RSDiff(z,s,k,object)
%function RSDiff uses the formula in article2006 to calculate image
eta=s;x=s;y=s;
n=length(s);
U=[object,zeros(n,n-1);zeros(n-1,n),zeros(n-1,n-1)];
X=[x(1)-s(n+1-(1:(n-1))),x((n:2*n-1)-n+1)-s(1)];
Y=[y(1)-eta(n+1-(1:(n-1))),y((n:2*n-1)-n+1)-eta(1)];
[XX,YY]=meshgrid(X,Y);
r=sqrt(XX.^2+YY.^2+z^2);
G=1/(2*pi)*exp(1i*k*r)./r*z./r.*(1./r-1i*k);
S=ifft2(fft2(U).*fft2(G));
Out=S(n:end,n:end);
end

