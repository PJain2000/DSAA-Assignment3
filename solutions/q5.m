clear all;
clc;

[s1, f1] = audioread( '1.wav' );
[s2, f2] = audioread( '2.wav' );
[s3, f3] = audioread( '3.wav' );
[s4, f4] = audioread( '4.wav' );
[s5, f5] = audioread( '5.wav' );

s1 = s1(:, 1);
s2 = s2(:, 1);
s3 = s3(:, 1);
s4 = s4(:, 1);
s5 = s5(:, 1);

s = [s1; s2; s3; s4; s5];
l = [length(s1); length(s2); length(s3); length(s4); length(s5)];
Fs = f1;

x = reorderDatagram(s, l, Fs);
% stem(abs(fft(x)))
% Option 1
y = lowpass(x, (16000*Fs)/size(x,1), Fs);
sound(y, Fs)
% Option2
% k = find(x > 0.99);
% x(k) = 0;
% sound(x, Fs)

