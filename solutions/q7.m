clear all;
clc;

t = readtable('Altitude.xls');

x1 = table2array(t([1:900], 1));
x2 = table2array(t([1:900], 2));

x = [x1 x2];

x3 = ones(size(x, 1), 1);

X = [x3 x];
Y = table2array(t([1:900], 3));

b1 = [0; 0; 0];
b2 = [0; 0; 0];
b3 = [0; 0; 0];

learningRate = 0.0001;

repetition = 1000;

m1 = size(Y, 1);
% Batch gradient descent %
for i = 1:repetition        
    h1 = (X * b1 - Y).';
    % Updating the parameters
    b1(1) = b1(1) - learningRate * (1/m1) * h1 * X(:, 1);
    b1(2) = b1(2) - learningRate * (1/m1) * h1 * X(:, 2);
    b1(3) = b1(3) - learningRate * (1/m1) * h1 * X(:, 3);
end 

m2 = 100;
% Mini batch gradient descent %
for i = 1:repetition
    for j = 1:100:801
        h2 = (X([j,j+99],:) * b2 - Y([j,j+99],:)).';
        % Updating the parameters
        b2(1) = b2(1) - learningRate * (1/m2) * h2 * X([j,j+99], 1);
        b2(2) = b2(2) - learningRate * (1/m2) * h2 * X([j,j+99], 2);
        b2(3) = b2(3) - learningRate * (1/m2) * h2 * X([j,j+99], 3);
    end
end

m3 = size(Y, 1);
% Stochastic gradient descent
for i = 1:repetition
    for j = 1:m3
        h3 = (X(j, :) * b3 - Y(j, :)).';
        % Updating the parameters
        b3(1) = b3(1) - learningRate * (1/m3) * h3 * X(j, 1);
        b3(2) = b3(2) - learningRate * (1/m3) * h3 * X(j, 2);
        b3(3) = b3(3) - learningRate * (1/m3) * h3 * X(j, 3);
    end
end

test_x1 = table2array(t([901:1000], 1));
test_x2 = table2array(t([901:1000], 2));
test_x = [test_x1 test_x2];

test_x3 = ones(size(test_x, 1), 1);

test_X = [test_x3 test_x];
test_Y = table2array(t([901:1000], 3));

error1 = abs(((norm((test_X*b1), 2) - norm(test_Y, 2))/norm(test_Y, 2))*100);
error2 = abs(((norm((test_X*b2), 2) - norm(test_Y, 2))/norm(test_Y, 2))*100);
error3 = abs(((norm((test_X*b3), 2) - norm(test_Y, 2))/norm(test_Y, 2))*100);
