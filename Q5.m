%This program shows the plot of the spectrum in both linear and
%logarithmic scale

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Reading a.wav
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
input = read_remove('a.wav');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       plotting frequency response of input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,1,1);
plot(abs(fft(input)));
xlabel('Frequency')
ylabel('Amplitude')
title('Frequency Domain Plot')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       plotting log magnitudes of frequency response of input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,1,2);
plot(log(abs(fft(input))));
xlabel('Frequency')
ylabel('Log Amplitude')
title('Frequency Domain Plot')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       displaying results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('The range of the fourier coefficients is too large in linear scale and its difficult to interpret');
disp('In this case , linear scale is from  0 to 300');
disp('In log scale the range is reduced and the resolution is increased which becomes easy to interpret');
disp('In this case, log scale is from -4 to 6 ');


% The range of the fourier coefficients is too large in linear scale and its difficult to interpret
% In this case , linear scale is from  0 to 300
% In log scale the range is reduced and the resolution is increased which becomes easy to interpret
% In this case, log scale is from -4 to 6