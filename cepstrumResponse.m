function c = cepstrumResponse(x, fs)
     N = length(x);
     x = x(:); % assure column vector
     w = hamming(N);
     x = x(:) .* w(:);
     y = fft(x, N);
     c = ifft(log(abs(y)));
end
     
     
     