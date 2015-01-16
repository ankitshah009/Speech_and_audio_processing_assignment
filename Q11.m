 % get a section of vowel

[x,fs]=wavread('a.wav');

% resample to 10,000Hz (optional)

x=resample(x,10000,fs);

fs=10000;

%

% plot waveform

t=(0:length(x)-1)/fs;        % times of sampling instants

subplot(2,1,1);

plot(t,x);

legend('Waveform');

xlabel('Time (s)');

ylabel('Amplitude');

%

% get Linear prediction filter

ncoeff=2+fs/1000;           % rule of thumb for formant estimation

a=lpc(x,ncoeff);

%

% plot frequency response

[h,f]=freqz(1,a,512,fs);

subplot(2,1,2);

plot(f,20*log10(abs(h)+eps));

legend('LP Filter');

xlabel('Frequency (Hz)');

ylabel('Gain (dB)');

 text(1000,-40,'Press Blank Space for next part of question','BackgroundColor',[.7 .9 .7]) 
 

% find frequencies by root-solving

r=roots(a);                  % find roots of polynomial a

r=r(imag(r)>0.01);           % only look for roots >0Hz up to fs/2

ffreq=sort(atan2(imag(r),real(r))*fs/(2*pi));

                             % convert to Hz and sort
for i=1:length(ffreq)

    fprintf('Formant %d Frequency %.1f\n',i,ffreq(i));

end

pause
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
 [formants,bandwidth] = find_formant(x,10);
 fs = 8000;
 t = (0:N-1)/fs;
 f=0:fs/(N-1):fs;
 
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
