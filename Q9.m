
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Asking for options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
option=input('write 1 for vowel.wav or 0 for non_vowel.wav : ');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       read_remove funtion reads a file and removes silence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(option==1)
input = read_remove('vowel.wav');
elseif(option==0)
 input = read_remove('non_vowel.wav');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Selecting a 160 sample frame and plotting it
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
frame = input(1001:1160);
figure;
plot(frame);
title('20ms of speech')
xlabel('time');
ylabel('amplitude');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Selecting a 160 sample frame and plotting it
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p = 10;
r0 = sum(frame.^2); 
for k = 1:p
   r(k) = 0;
    for n = 1 : 159-k
        r(k) = r(k) + frame(n)*frame(n+k);
   end
end
disp('Type "p" for order of the filter, "r0" for r(0), and "r" for rest of the auto correlation function ');
Q7; %Execute the 7th problem to find the filter co efficients a;
e(1) = frame(1);
for n = 2:160
    if (n < 11)
        e(n) = frame(n)+ sum(a(1:n-1).*frame(n-1:-1:1));
    else
        e(n) = frame(n)+sum(a(1:9).*frame(n-1:-1:n+1-p));
    end
end
      fs = 8000;
      ts = 1/fs;
      tmax = (length(frame)-1)*ts;
      t = 0:ts:tmax;
      f = -fs/2 : fs/(length(frame)-1) : fs/2;
      
      figure;
      plot(f,abs(fft(frame)));
      title('short time spectrum');
      xlabel('frequency');
      ylabel('amplitude');
      
      scap = filter(1,[1,a],e);
      figure;
      plot(t,scap);
      title('inverse filtered speech signal');
      xlabel('time');
      ylabel('amplitude');
      
      figure;
      plot(f,abs(fft(scap)));
      title('short time spectrum of inverse filtered speech signal');
      xlabel('frequency');
      ylabel('amplitude');
    
