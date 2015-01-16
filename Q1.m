%Question 1
%Record a short segment of speech corresponding to the word ‘zero’, Plot the signal and 
%Compute the signal mean, standard deviation, variance, average power, average 
%magnitude, and number of zero crossings.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Recording Zero for the first time and saving it.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recObj = audiorecorder;
%disp('Start speaking.')
%recordblocking(recObj, 2);
%disp('End of Recording.');
%zero=getaudiodata(recObj,'double');
%audiowrite('zero.wav',zero,8000);
%play(recObj);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Read zero.wav file and remove the silent part
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
speech_signal = read_remove('zero.wav');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Calculating and displaying number of samples
%       after removal of silence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
no_of_samples = length(speech_signal);                     
disp('Number of Samples =');disp(no_of_samples);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Finding Mean and displaying it
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mean = sum(speech_signal)/no_of_samples;                   
disp('Mean =');disp(mean);              

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Finding variance and displaying it
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var = sum((speech_signal-mean).^2)/no_of_samples;     
disp('Variance = ');disp(var);     

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Finding standard deviation displaying it
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
std_dev = sqrt(var);    
disp('Standard devaition = ');          
disp(std_dev);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Finding average power displaying it
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
avg_power = sum(speech_signal.^2)/no_of_samples;        
disp('Average power = ');                
disp(avg_power); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Finding average magnitude displaying it
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
avg_magnitude = sum(abs(speech_signal))/no_of_samples; 
disp('Average magnitude =');            
disp(avg_magnitude);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       This loop finds the number of zero crossings and
%       displaying it
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
zero_cross = 0;
for j = 2 : no_of_samples ;                          
                                         
    if (speech_signal(j)*speech_signal(j-1) < 0 )
        zero_cross = zero_cross + 1;
    
    end
end

disp('Zeros Crossings = ');              
disp(zero_cross);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Plot the time domain graph of zero
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1/8000:(length(speech_signal)-1)/8000;
plot(t,speech_signal);
xlabel('Time','fontsize',12)
ylabel('Amplitude','fontsize',12)
title('Time Domain Plot of Zero','fontsize',12)


% Number of Samples =
%         7600
% 
% Mean =
%   -3.0064e-05
% 
% Variance = 
%     0.0742
% 
% Standard devaition = 
%     0.2723
% 
% Average power = 
%     0.0742
% 
% Average magnitude =
%     0.1562
% 
% Zeros Crossings = 
%    348

