function  plot_spectrum(x)
N = length(x);
fs = 8000;
f = -fs/2 : fs/(N-1) : fs/2;
plot(f,abs(fft(x)));
end