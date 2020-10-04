clear all;
clc;

f = imread('q2_img1.jpg');
h = imread('q2_img2.png');

F1 = fft2(f);
H1 = fft2(h);

l1 = conv2(f, h, 'same');

r1 = ifft2(F1.*H1);

r1  = abs(r1);

% Part 2
a1 = norm(l1 - r1);
a1 = a1.^2;
error1 = a1/(256*256);

% Part 3

f2 = padarray(f, [255, 255], 'post');
h2 = padarray(h, [255, 255], 'post');

F2 = fft2(f2);
H2 = fft2(h2);

l2 = conv2(f2, h2, 'same');
l2 = l2./max(l2(:));

r2 = ifft2(F2.*H2);
r2 = r2./max(r2(:));

r2 = abs(r2);

a2 = norm(l2 - r2);
a2 = a2.^2;
error2 = a2/(511*511);