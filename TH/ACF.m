function [acf] = ACF(x)
% H?m t?nh ACF
N = length(x);
acf = zeros(1,N);
for i = 1 : N
    for j = 1 : N-i
        acf(i) = acf(i) + x(j)*x(i+j);
    end
end

%chuan hoa ham
AMax = max(acf);
acf = acf/AMax;
end