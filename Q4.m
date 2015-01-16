%This program finds the histogram of the speech amplitudes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Recording /asa/ for the first time and saving it.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recObj = audiorecorder;
%disp('Start speaking.')
%recordblocking(recObj, 2);
%disp('End of Recording.');
%asa=getaudiodata(recObj,'double');
%audiowrite('asa.wav',asa,8000);
%play(recObj);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Reading twenty_sec.wav
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
input = read_remove('twenty_sec.wav');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       hist() function plots histogram of input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hist(input);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Calculate mean of input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mean = 0;
for i=1:length(input)
    mean = mean + input(i);
end
mean = mean/length(input);
disp('mean = ');disp(mean);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       std() function calculates standard deviation of input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%std = std(input);
deviation=0;
for i=1:length(input)
    deviation = deviation + (mean-input(i))^2;
end
deviation=deviation/length(input);
std=sqrt(deviation);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       variance is square of standard deviation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
variance = std^2;
disp('variance = ');disp(variance);
disp('histogram is nothing but the frequencies of the different amplitudes of the signal');


% mean = 
%    5.2882e-05
% 
% variance = 
%     0.0232
% 
% histogram is nothing but the frequencies of the different amplitudes of the signal

