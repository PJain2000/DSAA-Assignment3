clear all;
clc;

i1 = imread('q3_img.jpg');

i2 = padarray(i1, 64, 'post');
i2 = i2.';
i2 = padarray(i2, 64, 'post');
i2 = i2.';

i3 = padarray(i2, 128, 'post');
i3 = i3.';
i3 = padarray(i3, 128, 'post');
i3 = i3.';

i4 = padarray(i3, 256, 'post');
i4 = i4.';
i4 = padarray(i4, 256, 'post');
i4 = i4.';

I1 = fftshift(fft2(i1));
I2 = fftshift(fft2(i2));
I3 = fftshift(fft2(i3));
I4 = fftshift(fft2(i4));

subplot(4,2,1);
imshow(i1);
subplot(4,2,2);
stem(abs(I1))


subplot(4,2,3);
imshow(i2);
subplot(4,2,4);
stem(abs(I2))

subplot(4,2,5);
imshow(i3);
subplot(4,2,6);
stem(abs(I3))

subplot(4,2,7);
imshow(i4);
subplot(4,2,8);
stem(abs(I4))

