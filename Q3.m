%Question 3
%Record a short segment of speech corresponding to the word ‘asa’, Identify the voiced 
%(i.e., /a/) and unvoiced (i.e., /s/) segments of the signal. Determine the pitch and try to 
%identify the gender of the speaker using the pitch information.

% This program finds the pitch by breaking the original speech into 30ms
% frames and finds the pitch by autocorrelation method.

%The pitch_detection function was taken from the downloaded speech processing toolbox 'traitement du son'

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
%       Reading asa.wav and removing silence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[speech, Fs]= read_remove('asa.wav');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Remove Voiced and Unvoiced speech from actual input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[v,u] = voice_unvoice(speech);
[autocor,lags] = xcorr(v);
autocor = autocor(find(lags==0):end);
auto=autocor(200:250);
  max1=0;
  for uu=1:length(auto)
    if(autocor(uu)>max1)
      max1=auto(uu);
      sample_no=uu;
    end 
  end
 
  pitch_period_To=(20+sample_no)*(1/Fs);
  pitch_freq_Fo=1/pitch_period_To;
  disp('pitch is')
  disp(pitch_freq_Fo);
  disp('As we can see that the pitch frequency is less than 200Hz, we can say that it is a males voice');
  disp('For female the pitch frequency is higher and is between 170 to 300Hz')
  
  
%   pitch is
%   137.9310
% 
% As we can see that the pitch frequency is less than 200Hz, we can say that it is a males voice
% For female the pitch frequency is higher and is between 170 to 300Hz
  