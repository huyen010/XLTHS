%Hàm t? t??ng quan ACF
%y: Tín hi?u ??u vào
%idx_f: Ch? s? khung c?n tính ACF
%size_f: S? m?u trong khung  
function arr_ACF = ACF(y,idx_f,size_f)
    arr_ACF = zeros(1,size_f);
    idx_sample = (idx_f-1)*size_f; 
    for i = 0:(size_f-1)  %?? tr?  
        s = 0;
        for m = (idx_sample+1):(idx_sample + size_f -1- i)
           s = s + y(m+1)*y(m+1+i);
        end
        arr_ACF(i+1) = s; %gán l?i t? t??ng quan ? v? trí i vào m?ng
    end
    arr_ACF(1:end) = arr_ACF(1:end)/max(arr_ACF);
end
