%Question 2 
% Take a speech signal and pass it through a lowpass filter, bandpass filter and highpass 
%filter. Listen to the filtered signals and comment on the characteristics of the signal such 
%as pitch and quality. Simulate a telephone channel frequency response and use it to the 
%filter the signal. Listen to the filtered signal. What are your observations?

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Reading zero.wav and removing silence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
speech= read_remove('zero.wav');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Passing the signal through a LPF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[numerator,denominator] = butter(10,0.4,'low');
f_low = filter(numerator,denominator,speech);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Passing the signal through a bandpass
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[numerator,denominator] = butter(10,[0.1 0.6],'bandpass');
f_band = filter(numerator,denominator,speech);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Passing the signal through a highpass
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[numerator,denominator] = butter(10,0.6,'high');
f_high = filter(numerator,denominator,speech);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Plotting signal plassed through LPF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,1);
plot(f_low);
axis([0,length(speech),-1,1]);
text(5000,-0.7,'Press Blank Space','BackgroundColor',[.7 .9 .7]) 
legend('LPF');
xlabel('Time','fontsize',12)
ylabel('Amplitude','fontsize',12)     
title('Time Domain Plot','fontsize',12)
sound(f_low);
pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Plotting signal plassed through HPF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,2);
plot(f_high);
axis([0,length(speech),-1,1]);
text(5000,-0.7,'Press Blank Space','BackgroundColor',[.7 .9 .7]) 
legend('HPF');
xlabel('Time','fontsize',12)
ylabel('Amplitude','fontsize',12)
title('Time Domain Plot','fontsize',12 )
sound(f_high);
pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Plotting signal plassed through BPF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,3);
plot(f_band);
axis([0,length(speech),-1,1]);
legend('BPF');
xlabel('Time','fontsize',12)
ylabel('Amplitude','fontsize',12)
title('Time Domain Plot','fontsize',12)
sound(f_band);