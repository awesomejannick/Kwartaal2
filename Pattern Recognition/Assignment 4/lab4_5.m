clear all;
close all;
figure;


[audio, samplerate] = audioread('corrupted_voice.wav');

% Plot original signal
subplot(1, 2, 1);
fourier = fft(audio);
freqs = (0:length(fourier)-1)*samplerate/length(fourier);
plot(freqs, abs(fourier));

% Design filter
% Best filter found:
% - Order: 6
% - Lower cutoff frequency: 500
% - Higher cutoff frequency: 2000
[b, a] = butter(6, [500 2000]/(samplerate/2), 'bandpass');
filtered = filter(b, a, audio);

% Plot filtered signal
fourier = fft(filtered);
subplot(1, 2, 2);
plot(freqs, abs(fourier));

% Save audio
audiowrite('filtered_voice.wav', filtered, samplerate);

% Play back audio
player = audioplayer(filtered, samplerate);
play(player);