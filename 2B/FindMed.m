function [y] = FindMed(x, N) %y la tin hieu sau khi loc, x la tin hieu truoc khi loc N la bac loc
y = x; %khoi tao gia tri tin hieu y
temp = 1:N; %tao truc thoi gian tin hieu cua so co chieu dai N
for k = 1:length(x) %k chay tu 1 den chieu dai cua tin hieu x
    for i = 1:N %i chay tu 1 den N
        %xet gia tri tin hieu cua so temp ben trai va ben phau tin hieu x, i < phan tu giua cua temp
        if((k < ceil(N/2))&& (i < ceil(N/2)-k+1)) || ((k > length(x) -ceil(N/2) + 1) && (i >= length(x) + ceil(N/2) - k + 1)) 
                temp(i) = 0;
        else 
            temp(i) = x(k + i - ceil(N/2));
        end
    end
    y(k) = median(temp); % median: tim phan tu trung vi cua day
end
end
