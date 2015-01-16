function [lsf,lar] = lsf_lar(a)
    atemp = a(2:end);
    p1 = length(atemp);
    rf = zeros(p1,1);
    for k = p1:-1:1
        rf(k) = atemp(k);
        for i = 1:1:k-1
            atemp(i) = (atemp(i) - rf(k)*atemp(k-i))/(1-rf(k)^2);
        end
    end
    lar = -2*atanh(-rf);
    if a(1) ~= 1.0,
       a = a./a(1);
    end;
    
    p  = length(a)-1;  % The leading one in the polynomial is not used
    a1 = [a 0];        
    a2 = a1(end:-1:1);
    P1 = a1-a2;        % Difference filter
    Q1 = a1+a2;        % Sum Filter 
    if rem(p,2),  % Odd order
     P = deconv(P1,[1 0 -1]);
     Q = Q1;
    else          % Even order 
     P = deconv(P1,[1 -1]);
     Q = deconv(Q1,[1  1]);
    end

    rP  = roots(P);
    rQ  = roots(Q);

    aP  = angle(rP(1:2:end));
    aQ  = angle(rQ(1:2:end));

    lsf = sort([aP;aQ]);
end
    
    
        