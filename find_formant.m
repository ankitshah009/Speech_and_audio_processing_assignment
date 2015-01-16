function [formant,bw] = find_formant(x1,p)
Fs=8000;
A = lpc(x1,p);
rts = roots(A);
rts = rts(imag(rts)>=0);
angz = atan2(imag(rts),real(rts));
[frqs,indices] = sort(angz.*(Fs/(2*pi)));
bw = -1/2*(Fs/(2*pi))*log(abs(rts(indices)));
nn = 1;
for kk = 1:length(frqs)
    if (frqs(kk) > 90 && bw(kk) <400)
        formant(nn) = frqs(kk);
        nn = nn+1;
    end
end

end

