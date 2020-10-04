clear all;
clc;

t = csvread('houses.csv');

x1 = t([1:42], [1:2]);
x2 = ones(size(x1, 1), 1);
X = [x2 x1];
Y = t([1:42], 3);

% Part 1
b = inv((X.')*X)*(X.')*Y;
% Or use mldivide, solution for Xb = Y is b = X\Y
% b = X\Y;

test_x1 = t([43:47], [1:2]);
test_x2 = ones(size(test_x1, 1), 1);
test_X = [test_x2 test_x1];

test_Y = t([43:47], 3);
pa = test_X*b;
% test_x1 = (test_x1 - max(test_x1))/(max(test_x1) - min(test_x1));
% test_x2 = (test_x2 - max(test_x2))/(max(test_x2) - min(test_x2));
error = abs(((norm((test_X*b), 2) - norm(test_Y, 2))/norm(test_Y, 2))*100);

% Part 2
nx1 = t([1:42], 1);
nx2 = t([1:42], 2);

nxt1 = (nx1 - min(nx1))/(max(nx1) - min(nx1));
nxt2 = (nx2 - min(nx2))/(max(nx2) - min(nx2));

nx3 = ones(size(nxt1, 1), 1);
nX = [nx3 nxt1 nxt2];

nY = t([1:42], 3);
% nY = (nY - max(nY))/(max(nY) - min(nY));

nb = inv((nX.')*nX)*(nX.')*nY;

test_nx1 = t([43:47], 1);
test_nx2 = t([43:47], 2);

test_nx1 = (test_nx1 - min(nx1))/(max(nx1) - min(nx1));
test_nx2 = (test_nx2 - min(nx2))/(max(nx2) - min(nx2));

test_nx3 = ones(size(test_nx1, 1), 1);
test_nX = [test_nx3 test_nx1 test_nx2];

test_nY = t([43:47], 3);
% test_nY = (test_nY - max(test_nY))/(max(test_nY) - min(test_nY));
apa = test_nX*nb;
nerror = abs(((norm((test_nX*nb), 2) - norm(test_nY, 2))/norm(test_nY, 2))*100);

% Part 3
p = mean(t([1:42], 1));
q = mean(t([1:42], 2));
r = mean(t([1:42], 3));

mean_val = b(1) + p*b(2) + q*b(3);
