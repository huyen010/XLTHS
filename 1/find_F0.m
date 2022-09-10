%========HÀM TÍNH F0========
% arr_F0: m?ng g?m các giá tr? F0
% y: tín hi?u ??u vào
% size_f: s? m?u/khung
% Fs: t?n s? l?y m?u
% threshold: Ng??ng
function [arr_F0] = find_F0(y,size_f,Fs,threshold)  
    N = length(y); %Chi?u dài tín hi?u tính theo m?u
    N_f = round(N/size_f); %N_f: S? khung    
    arr_F0 = zeros(1,N_f);   
    for idx_f = 1:N_f-1       
        arr_ACF = ACF(y,idx_f,size_f);
        [peak,pos] = findpeaks(arr_ACF,'MinPeakDistance',Fs/400,'MinPeakHeight',threshold);
        if length(peak) == 1
            arr_F0(idx_f) = Fs/pos;
        elseif length(peak) >= 2
            arr_F0(idx_f) = Fs/(pos(2)-pos(1));
        else
            arr_F0(idx_f) = inf;
        end
    end 
    for idx_f = 1:N_f-1
        if arr_F0(idx_f) <= 70 || arr_F0(idx_f) >= 400
            arr_F0(idx_f) = inf;
        end
    end
    F0mean = mean(arr_F0((arr_F0>=70) & (arr_F0<=400)));
    for idx_f = 1:N_f-1
        if arr_F0(idx_f) > 1.7*F0mean || arr_F0(idx_f) < 0.25*F0mean
           arr_F0(idx_f) = inf;
        end
    end
end