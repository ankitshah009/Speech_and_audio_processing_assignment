function f0 = pitchCepstrum(c, fs)
    ms2=floor(fs*0.002); % 2ms
    ms20=floor(fs*0.02); % 20ms
    [maxi,idx]=max(abs(c(ms2:ms20)));
    if idx == 1,
       f0 = 0;
    else
       f0 = fs/(ms2+idx-1);
end