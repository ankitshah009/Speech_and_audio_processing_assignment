% Sampling frequency in Hz (for the data used in this demo i.e TIMIT database signals)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Reading and removing silence part from zero.wav
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
speech = read_remove('zero.wav');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Long window in time - Narrowband
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs = 16000;
t_window_narrowband = .05;		% window - time
t_overlap_narrowband = .001;

window_narrowband = t_window_narrowband*Fs;     % window samples
noverlap_narrowband = t_overlap_narrowband*Fs;
nfft_narrowband = 1024;

window = window_narrowband;
noverlap = noverlap_narrowband;
nfft = nfft_narrowband;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Plotting narrowband spectogram
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,1,1);
spectrogram(speech,window,noverlap,nfft,Fs,'yaxis');
xlabel('Time (sec)','fontsize',12);
ylabel('Frequency (Hz)','fontsize',12);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Short window in time - wideband
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t_window_wideband = .005;		% window - time
t_overlap_wideband = .001;
window_wideband = t_window_wideband*Fs;	% window samples
noverlap_wideband = 1; %t_overlap_wideband*Fs;
nfft_wideband = 8192;

window = window_wideband;
noverlap = noverlap_wideband;
nfft = nfft_wideband;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Plotting widebandband spectogram
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,1,2)
spectrogram(speech,window,noverlap,nfft,Fs,'yaxis');
xlabel('Time (sec)','fontsize',12);
ylabel('Frequency (Hz)','fontsize',12);
