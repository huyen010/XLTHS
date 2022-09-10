clear all; clc;

 timeV = [0.53 1.14;1.21 1.35;1.45 1.60;1.83 2.20;2.28 2.35;2.40 2.52;2.66 2.73];
 timeUV = [1.14 1.21;1.35 1.45;1.60 1.83;2.20 2.28;2.35 2.40;2.52 2.73;2.73 2.75];
 [y,Fs] = audioread('E:\Năm 3\Học kỳ 5\Xử lý tín hiệu\BT nhom\TinHieuHuanLuyen\phone_F1.wav');
% timeV = [0.46 1.39;1.50	1.69;1.79 2.78;2.86	2.93;3.10 3.29;3.45	3.52];
% timeUV = [1.39 1.50;1.69 1.79;2.78 2.86;2.93 3.10;3.29	3.45];  
% [y,Fs] = audioread('E:\Năm 3\Học kỳ 5\Xử lý tín hiệu\BT nhom\TinHieuHuanLuyen\phone_M1.wav');
%  timeV = [0.70 1.10;1.13 1.22;1.27 1.65;1.70 1.76;1.79 1.86;1.92 2.15];
%  timeUV = [0.68 0.70;1.10 1.13;1.22 1.27;1.65 1.70;1.76 1.79;1.86 1.92];
%  [y,Fs] = audioread('E:\Năm 3\Học kỳ 5\Xử lý tín hiệu\BT nhom\TinHieuHuanLuyen\studio_F1.wav');
%  timeV = [0.94 1.26;1.33 1.59;1.66 1.78;1.82 2.06];
%  timeUV = [0.87 0.94;1.26 1.33;1.59 1.66;1.78 1.82];
%  [y,Fs] = audioread('E:\Năm 3\Học kỳ 5\Xử lý tín hiệu\BT nhom\TinHieuHuanLuyen\studio_M1.wav');  

N = length(y); %Chiều dài của tín hiệu tính theo frame
ts = 1/Fs;%Chu kì lấy mẫu
t = 0:ts:(N/Fs-ts); %trục thời gian của cả tín hiệu
t_f = 0:ts:0.02-ts; %trục thời gian (s) của frame
%Phân khung tín hiệu
length_f = 0.02; %length_f: Độ dài khung (ms)
size_f = round(length_f*Fs); %size_f: Số mẫu/khung
N_f = round(N/size_f); %N_f: Số khung


for i = 1:length(timeV(:,1))
    start_f_V = ceil(timeV(i,(1))/length_f);%Frame đầu tiên của timelab
    end_f_V = round(timeV(i,(2))/length_f);
    sokhungcantinh = end_f_V - start_f_V + 1;
    arr_max_peak = zeros(1,sokhungcantinh);
    j = 1:sokhungcantinh;  
    peak = 0;
    for idx = start_f_V:end_f_V
        pitchs= ACF(y,idx,size_f);%Hàm tự tương quan tại frame idx
        [peak,pos] =  find_peaks(pitchs,size_f,Fs); %tìm peak
        arr_max_peak(j) = max(peak); %trả giá trị peak vào mảng arr;
        j = j + 1;
     end
     meanV(i,1) = mean(arr_max_peak);
     stdV(i,1)= std(arr_max_peak); 
 end

 for i = 1:length(timeUV(:,1))
     start_f_UV = ceil(timeUV(i,(1))/length_f);%Frame đầu tiên của timelab
     end_f_UV = round(timeUV(i,(2))/length_f);
     sokhungcantinh = end_f_UV - start_f_UV + 1;
     arr_max_peak = zeros(1,sokhungcantinh);
     j = 1:sokhungcantinh;  
     peak = 0;
     for idx = start_f_UV:end_f_UV
        pitchs= ACF(y,idx,size_f);%Hàm tự tương quan tại frame idx
        [peak,pos] =  find_peaks(pitchs,size_f,Fs); %tìm peak
        arr_max_peak(j) = max(peak); %trả giá trị peak vào mảng arr;
        j = j + 1;
     end
     meanUV(i,1) = mean(arr_max_peak);
     stdUV(i,1)=std(arr_max_peak);
 end

%Hàm tìm cực đại cục bộ trong 1 frame
%Peak: Giá trị cực đại cục bộ 
%Locations: Những độ trễ tại cực đại cục bộ
%arr_ACF: Mảng mang giá trị hàm tự tương quan ACF
%size_f: Số mẫu/1frame
%Fs: tần số lấy mẫu
 function [Peak,Locations] = find_peaks(arr_ACF,size_f,Fs)
    arr_Peak = zeros(1,size_f);
    idx_Peak = 1;
    Locations = 1;
    for i = 2:(size_f-1)
        if arr_ACF(i) > arr_ACF(i+1) && arr_ACF(i) > arr_ACF(i-1)
            Peak(idx_Peak) = arr_ACF(i);
        end
        idx_Peak = idx_Peak + 1;
    end
    for i = 0:(size_f-1)
        if(i<Fs/400) || (i>Fs/70)
            Peak(i+1) = 0;
            idx_Peak = idx_Peak -1 ;
        end
    end
    for i = 2:idx_Peak - 1
        if Peak(i) > Peak(i-1)
            Locations = i;
        end
    end
end










