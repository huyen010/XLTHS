%H�m t? t??ng quan ACF
%y: T�n hi?u ??u v�o
%idx_f: Ch? s? khung c?n t�nh ACF
%size_f: S? m?u trong khung  
function arr_ACF = ACF(y,idx_f,size_f)
    arr_ACF = zeros(1,size_f);
    idx_sample = (idx_f-1)*size_f; 
    for i = 0:(size_f-1)  %?? tr?  
        s = 0;
        for m = (idx_sample+1):(idx_sample + size_f -1- i)
           s = s + y(m+1)*y(m+1+i);
        end
        arr_ACF(i+1) = s; %g�n l?i t? t??ng quan ? v? tr� i v�o m?ng
    end
    arr_ACF(1:end) = arr_ACF(1:end)/max(arr_ACF);
end
