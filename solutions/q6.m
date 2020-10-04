  clear all;
clc;

count = 1;
arr = [10:10:100];

time = [];
time_imp = [];
img = double((imread('cameraman.tif')));

for k = 10:10:200
    i1 = padarray(img, [k, k]);
    b = i1;
    d = i1;
    
    tic
    for i = ceil(k/2):size(i1, 1)-ceil(k/2)
        for j = ceil(k/2):size(i1, 2)-ceil(k/2)
            a = i1((i-ceil(k/2)+1):(i+ceil(k/2)), (j-ceil(k/2)+1):(j+ceil(k/2)));
            c = cumsum(sum(a));
            d(i, j) = c(end)/(k*k);
        end
    end
    time(count) = toc;
    
    val = 0;
    tic
    for i = ceil(k/2):size(i1, 1)-ceil(k/2)
        for j = ceil(k/2):size(i1, 2)-ceil(k/2)
            r_col = 1/(k*k) * sum(i1([(i-ceil(k/2)+1):(i+ceil(k/2))], [(j-ceil(k/2)+1):(j-ceil(k/2)+1)])');
            a_col = 1/(k*k) * sum(i1([(i-ceil(k/2)+1):(i+ceil(k/2))], [(j+ceil(k/2)):(j+ceil(k/2))])');
            val = val - r_col + a_col;
            b(i,j) = val;
        end
        val = 0;
    end
    time_imp(count) = toc;
    count = count + 1;
end

hold on
plot(arr, time)
plot(arr, time_imp)
hold off
