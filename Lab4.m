clc;
clear all;
close all;


[y, Fs] = audioread('corrupted_audio_files/corrupted_audio_1.wav');
sound(y, Fs) 

Y = fft(y);

frequencies = (0:1:((length(Y)/2) - 1))' .* Fs/length(y);
plot(frequencies, abs(Y(1:end/2)))

% Remove higher frequencies in frequency domain
cutoffFrequencyHz = 10000;
fidx = uint32(cutoffFrequencyHz/(Fs/length(y)));
Y(fidx:end - fidx) = 0;

figure
plot(frequencies, abs(Y(1:end/2)))

figure
plot(frequencies, abs(Y(1:end/2)))