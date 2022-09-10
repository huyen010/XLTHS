function [f,t,F0Std,F0Mean] = ValueF0(y,Fs,FrameSize)
%Ham tim tan so F0
%y: vecto tin hieu  
%Fs: tan so lay mau
%FrameSize: do dai cua mot khung theo mau
%SL_Khung: So luong khung tin hieu
%L_Min : do tre nho nhat
%L_Max : do tre lon nhat
%t: vecto thoi gian
SL_Khung = ceil(length(y)/FrameSize);
t = ((0:SL_Khung-1)*FrameSize + (FrameSize/2))/Fs; 
f = zeros(1,SL_Khung); 
L_Min = round(Fs/450);
L_Max = round(Fs/70);
% chuan hoa AMDF cho tung khung
%Neu frame vo thanh f0 = 0, frame huu thanh tim f0
for n = 1:SL_Khung
    first = (n-1)*FrameSize + 1; 
    last = min(first + FrameSize - 1, length(y)); 
    frame = y(first:last);
    [amdf] = AMDF(frame);
    Frame = checkFrame(amdf,L_Min,L_Max);
    if Frame == -1 
        f(n) = 0;
    else
        A_Min = 1;
        LMin = 2; 
        %tim cuc tieu co gia tri nho nhat, tranh truong hop tan so ao bien
        %do giua 2 cuc tieu phai > 0.1
        for i = L_Min : length(amdf)-1
           if(i <= L_Max)
                if (amdf(i)<amdf(i-1)) && (amdf(i)<amdf(i+1))
                    if (A_Min - 0.1 > amdf(i))
                        A_Min = amdf(i);
                        LMin = i;
                    end
                end
           end
        end
        f(n) = Fs/LMin;   
    end   
end 
    % loai cac phan tu bang 0, tinh std va mean bang ham cua matlab
    FF=nonzeros(f);
    FF = medfilt1(FF, 9);
    F0Std = std(FF);
    F0Mean = mean(FF);
    f = medfilt1(f,9);
end
    