clc;
clear;

%-------------------------------------------------------------------------
%       reading a wav file and removing silence
%-------------------------------------------------------------------------
x=read_remove('asa.wav');

%-------------------------------------------------------------------------
%       Initialization
%-------------------------------------------------------------------------
N=length(x);
Fs = 8000;
freq = 1000;
t = 0.02;
f=0:Fs/(N-1):Fs;

%-------------------------------------------------------------------------
%       Generating an Impulse train of the required duration
%-------------------------------------------------------------------------
imp = zeros(1,Fs*t);
noise = awgn(imp,0);
for i = 1:1:t*Fs,
    if mod(i,Fs/freq) == 0,
        imp(i) = 1;
    end
end
time = 0:1/Fs:(length(x)-1)/Fs;

%-------------------------------------------------------------------------
%       Excitation of a 10th order AR Filter with an impulse train and AWGN
%-------------------------------------------------------------------------
N = length(x);
discard = mod(N,16);
voiced = [];
unvoiced = [];
for frame_idx = 1:160:(N-discard),
    a = lpc(x(frame_idx:frame_idx+159),10);
    voiced = [voiced filter(1,a,imp)];
    unvoiced = [unvoiced filter(1,a,noise)];
    %frame_idx;
end

otpt_v_spec = abs(fft(voiced));
otpt_uv_spec = abs(fft(unvoiced));
otpt_x = abs(fft(x));

%-------------------------------------------------------------------------
%       Plotting the output
%-------------------------------------------------------------------------
 subplot(3,2,1); plot(time,x);%axis([0 2.5 -1 1])
 title('Original signal','fontsize',12);
 sound(x);
 subplot(3,2,2); plot(f,otpt_x);%axis([0 2.5 -1 1])
 title('FFT of Original signal','fontsize',12);
 text(2000,700,'Press Blank Space','BackgroundColor',[.7 .9 .7]) 
 pause
 subplot(3,2,3); plot(time,voiced);%axis([0 2.5 -1 7])
 title('Impulse excitation','fontsize',12);
 sound(voiced);
 subplot(3,2,4); plot(f,otpt_v_spec);%axis([0 2.5 -100 10000])
 title('Impulse excitation','fontsize',12);
 text(2000,25000,'Press Blank Space','BackgroundColor',[.7 .9 .7]) 
 pause
 subplot(3,2,5); plot(time,unvoiced);%axis([0 2.5 -1 1])
 title('AWGN excitation','fontsize',12);
 sound(unvoiced);
 subplot(3,2,6); plot(f,otpt_uv_spec);%axis([0 2.5 -10 10000])
 title('AWGN excitation','fontsize',12);
 
 