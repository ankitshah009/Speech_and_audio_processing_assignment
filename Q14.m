 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Record sound
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
 %soundClip = audiorecorder(8000,16,1);
 %recordblocking(soundClip, 5);
 %input = getaudiodata(soundClip);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Remove silence
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %x = silence_removal1(input);
 x=read_remove('twenty_sec.wav');
 N = length(x);
 fs = 8000;
 frame_length = 30;
 frame_overlap = 20;
 nsample = round(frame_length  * fs / 1000); % convert ms to points
 noverlap = round(frame_overlap * fs / 1000); % convert ms to points
 window   = eval(sprintf('%s(nsample)', 'hamming')); % e.g., hamming(nfft)
%Pitch detection for each frame
 pos = 1; i = 1;
 while (pos+nsample < N)
     frame = x(pos:pos+nsample-1);
     C(:,i) = cepstrumResponse(frame, fs);
     F0(i) = (pitchCepstrum(C(:,i), fs));
     pos = pos + (nsample - noverlap);
     i = i + 1;
 end
 T = (round(nsample/2):(nsample-noverlap):N-1-round(nsample/2))/fs;
  subplot(3,1,1);
  t = (0:N-1)/fs;
  plot(t, x);
  legend('Waveform');
  xlabel('Time (s)','fontsize',12);
  ylabel('Amplitude','fontsize',12);
  xlim([t(1) t(end)]);
   title('Time domain waaveform','fontsize',12);
  
  subplot(3,1,2);
  plot(T,F0,'.');
  legend('pitch track');
  xlabel('Time (s)','fontsize',12);
  ylabel('Frequency (Hz)','fontsize',12);
  xlim([t(1) t(end)]);
  title('Pitch Contour obtained by cepstral analysis','fontsize',12);
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Pitch contour by Autocorrelation method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y=x;
Fs=8000;
sample_no=0;
mtlb_t=0;
data=y;
Frame_size = 30; 
Frame_shift = 10; 
max_value=max(abs(y));
y=y/max_value;
window_period=Frame_size/1000;
shift_period=Frame_shift/1000;
window_length = window_period*Fs;
sample_shift = shift_period*Fs;
sum1=0;energy=0;autocorrelation=0;
for i=1:(floor((length(y))/sample_shift)-ceil(window_length/sample_shift))
  k=1;yy=0;
  for j=(((i-1)*sample_shift)+1):(((i-1)*sample_shift)+window_length)
    yy(k)=y(j);
    k=k+1;
  end
  
  for l=0:(length(yy)-1)
    sum1=0;
    for u=1:(length(yy)-l)
      s=yy(u)*yy(u+l);
      sum1=sum1+s;
    end
    autocor(l+1)=sum1;
   
  end

  auto=autocor(21:240);
  max1=0;
  for uu=1:220
    if(auto(uu)>max1)
      max1=auto(uu);
      sample_no=uu;
    end
    if max1 == 0,
     pitch_freq(i) = 0;
     else
          pitch_period_To=(20+sample_no)*(1/fs);
          pitch_freq(i)=1/pitch_period_To;
    end
  end
  pitch_freq(i)=1/((20+sample_no)*(1/Fs));
end
rows=length(yy);
cols=(floor((length(y))/sample_shift)-ceil(window_length/sample_shift));
kkk=1/Fs:shift_period:(cols*shift_period);
subplot(3,1,3);
plot(kkk,pitch_freq,'.');
legend('pitch track');
xlabel('Time','fontsize',12)
ylabel('Cepstral Amplitude','fontsize',12);
xlim([t(1) t(end)]);
title('Pitch Contour obtained by autocorrelation of speech signal','fontsize',12);

disp('We can see some differences in pitch calculation when there is noice.')
disp('But when there is actual speech signal, both methods almost show the same pitch.')