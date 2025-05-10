clc;
clear all;
close all;

% sampling rate: 44100 Hz
fs = 44100;

x = 0:0.01:2*pi;
f = 400;                % desired frequency in Hz
s= 1;                 % duration of signal in seconds
t = 0:s/fs:s;         % generate an array of time values in seconds
yt = sin(2*pi*t*f);

note_sequence = input("Please enter a note or sequence" ,  "s");

% Reconstruct into an array
note_sequence = cellstr(num2cell(note_sequence));

for ii = 0 : length(note_sequence)
    note = note_sequence(ii);

    if note == "C" 
    f = 261.63;
    else if note  == "C#"
            f = 277.18;
    else if note == "D"
            f = 293.66;
    else if note == "D#"
            f = 311.13;
    else if note == "E"
            f = 329.63;
    else if note == "F"
            f = 349.23;
    else if note == "F#"
            f = 369.99;
    else if note == "G"
            f = 392;
    else if note == "G#";
            f = 415.3;
    else if note == "A";
            f = 440;
    else if note == "B";
            f =  466.16;
    end

    sound(yt, fs);
    pause(1);

end




