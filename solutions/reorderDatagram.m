function sig = reorderDatagram(s, l, Fs)
    num = length(l);
    pad_len = max(l);
    
    a = zeros(pad_len, num);
    j = 1;
    m = 0;
    for i = 1:num
        m = m + l(i);
        a([1:l(i)],i) = s([j:m]);
        j = j + l(i);
    end
    
    g = zeros(5*Fs, 2*num);
    k = 1;
    for i = 1:2:2*num
         g(:, i) = a([1: (5*Fs)],k);
         g(:, i+1) = a([l(k) - (5 * Fs) + 1: l(k)], k);
         k = k + 1;
    end
    
    h = zeros(10*Fs - 1, 5);
    n = zeros(1, 10);
    finalans = zeros(1, 5);
    m = zeros(1, 5);
    b = 1;
    k = 1;
    for i = 1:2:(2*num-1)
        h(:, :) = 0;
        k = 1;
        
        for j = 2:2:(2*num)
            if j ~= i+1
                h(:,k) = xcorr(g(:, j), g(:,i));
                k = k + 1;
            else
                h(:,k) = 0;
                k = k + 1;
            end
        end
        
        for j = 1:num
            n(j) = max(h(:,j));
        end
        
        [m(b), finalans(b)] = max(n);
        [~, t] = min(m);
        
        b = b+1;
    end
    seq = [];
    seq(1) = t;
    for i = 1:num-1
        seq(i+1) = find(finalans == seq(i));
    end

    out = a([1:l(t)],t);
    for i = 2:num
        signal = a([1:l(seq(i))],seq(i));
        [C,lag] = xcorr(out, signal);
        C = C/max(C);
        
        [~,I] = max(C);
        
        tdiff = lag(I);
        out = [out; signal(5*Fs + tdiff - 1: end)];
    end
    
    sig  = out;
    
end
