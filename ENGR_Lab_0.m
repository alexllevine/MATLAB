% Provided in Lab
clc;
clear all;
close all;

bill = 320;
tip = 0.3;

% Start of independent work here
people = 6;

if people >= 6
    tip  = tip + 0.18;
end

total = bill + bill * tip;

amount_owed_per_person = total / people;
disp(amount_owed_per_person);