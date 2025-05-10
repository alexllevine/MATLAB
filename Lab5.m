clc;
clear all;
close all;

%I = imread('images/dark_image1.png');
%imshow(I);

%I = I + 50;
%I = I*3;

%figure 
%imshow(I);

%X = imread('images/dark_image2.png');
%imshow(X);

%I = I + 50;
%X = X*5;

%figure 
%ks = 1; % Kernel matrix row/col size
%k = ones(ks,ks) .* (1/(ks*ks));
% Apply 2D convolution
%X2 = convn(X, k, 'same');
% Round results back to integer values
%I2 = uint8(X2);

%figure
%imshow(X2);

I = imread('images/blurred_image2.png');
imshow(I);

X = [0,-1,0;-1, 5, -1;0, -1 ,0];
% Sharpen image
ks = 1;     % Kernel matrix row/col size
k = X .* (1/(ks*ks));
% Apply 2D convolution
I2 = convn(I, k, 'same');
% Round results back to integer values
I2 = uint8(I2);

figure
imshow(I2);
