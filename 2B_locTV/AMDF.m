function [amdf] = AMDF(x)
% H?m t?nh amdf
N = length(x);
amdf = zeros(1,N);
for i = 1 : N
    for j = 1 : N-i
        amdf(i) = amdf(i) + abs(x(j)-x(i+j));
    end
end

%chuan hoa ham
AMax = max(amdf);
amdf = amdf/AMax;
end