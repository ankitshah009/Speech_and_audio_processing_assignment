%--------------------------------------------------------------
% Prediction error as a function of AR model order with plot
%--------------------------------------------------------------
voiced = read_remove('a.wav');
[r1,lags1] = xcorr(voiced);
r1 = r1(find(lags1==0):end);
unvoiced = read_remove('non_vowel.wav');
[r2,lags2] = xcorr(unvoiced);
r2 = r2(find(lags2==0):end);
for i = 1:15
[x1,error1(i)]=levinson(r1,2*i);
[x2,error2(i)]=levinson(r2,2*i);
end
p = 2:2:30;
subplot(2,1,1); plot(p,error1)
title('Prediction error v/s order : unvoiced');
xlabel('order');
ylabel('error');
subplot(2,1,2); plot(p,error2)
title('Prediction error v/s order : voiced');
xlabel('order');
ylabel('error');
