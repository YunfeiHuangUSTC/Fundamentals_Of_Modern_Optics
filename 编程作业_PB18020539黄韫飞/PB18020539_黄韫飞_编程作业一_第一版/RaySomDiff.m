function Uout = RaySomDiff(z,k,x0,y0,object)
%RaySomDiff shows the process of FFT and iFFT to get Uout in any point
r=sqrt(x0.^2+y0.^2+z^2);
g=-1/(2*pi)*exp(1i*k*r)./(r.^2)*z.*(1i*k-1./r);
fftU0=fftshift(fft2(object));
fftg=fftshift(fft2(g));
Uout=fftshift(ifft2(fftU0.*fftg));
end

