clear all;
clc;

load('Q4.mat');

stem(abs(fft(X)));

x = fft(X);
[y, I] = sort(abs(x), 'descend');
z = [I(1) - 1, I(3) - 1];

k = find(abs(x) < 500);
    
x(k) = 0;

Y = ifft(x);

sound(Y, Fs)