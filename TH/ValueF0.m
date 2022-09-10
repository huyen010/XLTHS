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
% chuan hoa acf cho tung khung
%Neu frame vo thanh f0 = 0, frame huu thanh tim f0
for n = 1:SL_Khung
    first = (n-1)*FrameSize + 1; 
    last = min(first + FrameSize - 1, length(y)); 
    frame = y(first:last);
    [acf] = ACF(frame);
    Frame = checkFrame(acf,L_Min,L_Max);
    if Frame == -1 
        f(n) = 0;
    else
        A_Max = 0;
        LMax = 0; 
        %tim cuc tieu co gia tri nho nhat, tranh truong hop tan so ao bien
        %do giua 2 cuc tieu phai > 0.1
        for i = L_Min : length(acf)-1
           if(i <= L_Max)
                if (acf(i)>acf(i-1)) && (acf(i)>acf(i+1))
                    if (A_Max + 0.09 < acf(i))
                        A_Max = acf(i);
                        LMax = i;
                    end
                end
           end
        end
        f(n) = Fs/LMax;   
    end   
end 
    % loai cac phan tu bang 0, tinh std va mean bang ham cua matlab
    FF=nonzeros(f);
    FF = FindMed(FF,9);
    F0Std = std(FF);
    F0Mean = mean(FF);
    f = FindMed(f,9);
end