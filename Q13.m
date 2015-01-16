
%time=5;
%Fs=8000;
%signal=audiorecorder;
%signal.StartFcn = 'disp(''Start speaking.'')';
%signal.StopFcn = 'disp(''End of recording.'')';
%recordblocking(signal, time);
%voice_signal = getaudiodata(signal,'double');
%audiowrite('q13.wav',voice_signal,Fs)
%[voice_signal,fs,nbits]=wavread('q13.wav'); % read file into memory *

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Reading and removing silence from q13.wav
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[voice_signal,Fs]=read_remove('q13.wav');
t=0:1/Fs:(length(voice_signal)-1)/Fs;
%sound(voice_signal);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Plot of normal voice and its cepstrum
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,2,1);
plot(t,voice_signal,'b');
xlabel('Time','fontsize',12)
ylabel('Amplitude','fontsize',12)
title('Time Domain Plot','fontsize',12)
ceps_voice_signal=rceps(voice_signal);
subplot(3,2,2);
plot(t,ceps_voice_signal,'g');
xlabel('Time','fontsize',12)
ylabel('Cepstral Amplitude','fontsize',12)
title('Cepstral Domain Plot','fontsize',12)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Fourier Transform of voice signal and its cepstrum
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n=length(voice_signal)-1;
f=0:Fs/n:Fs;
wavefft=abs(fft(voice_signal)); % perform Fourier Transform
subplot(3,2,3);
plot(f,wavefft,'b'); % plot Fourier Transform 
xlabel('frequency','fontsize',12)
ylabel('Amplitude','fontsize',12)
title('F-Domain Plot of normal signal','fontsize',12)
wavefft=abs(fft(ceps_voice_signal)); % perform Fourier Transform
subplot(3,2,4);
plot(f,wavefft,'g');
xlabel('frequency','fontsize',12)
ylabel('Amplitude','fontsize',12)
title('F-Domain Plot of cepstral signal','fontsize',12)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Passing normal signal and its cepstral through low pass Lifter and plotting it
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
frame=ceps_voice_signal(1:200);
w=hamming(200);
w=w.';
frame=frame.*w;
l=zeros(1,length(frame));
l(1:30)=1;
low_lifted_ceps_signal=real(frame.*l);
subplot(3,2,5);
hold on
plot(l,'b');
plot(low_lifted_ceps_signal,'g');
hold off
xlabel('frequency','fontsize',12)
ylabel('Amplitude','fontsize',12)
title('Low pass Liftering of Cepstrum','fontsize',12)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Passing normal signal and its cepstrum through HPF and plotting it
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=zeros(1,length(frame));
 h(30:length(frame))=1;
 high_lifted_ceps_signal=real(frame.*h);
subplot(3,2,6);
hold on
plot(h,'b'); 
plot(high_lifted_ceps_signal,'g');
hold off
xlabel('frequency','fontsize',12)
ylabel('Amplitude','fontsize',12)
title('High pass Liftering of Cepstrum','fontsize',12)

