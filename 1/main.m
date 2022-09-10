clear all; 
threshold = 0.5;

for f = 1:8
     if f == 1
         file = ('D:\XLTHS\2B\01MDA.wav');
         f_V = 32;
         f_UV = 53;
         figure('name','01MDA');
     end
      if f == 2
          file = ('D:\XLTHS\2B\02FVA.wav');
          f_V =50;
          f_UV =80;
          figure('name','02FVA');
      end
       if f == 3
           file = ('D:\XLTHS\2B\03MAB.wav');
           f_V = 50;
           f_UV = 70;  
           figure('name','03MAB');
       end
       if f == 4
           file = ('D:\XLTHS\2B\06FTB.wav');
           f_V = 30;
           f_UV = 78;
           figure('name','06FTB');
       end
       if f == 5
           file = ('D:\XLTHS\2B\30FTN.wav');
           f_V = 30;
           f_UV = 78;
           figure('name','30FTN');
       end
       if f == 6
           file = ('D:\XLTHS\2B\42FQT.wav');
           f_V = 30;
           f_UV = 78;
           figure('name','42FQT');
       end
       if f == 7
           file = ('D:\XLTHS\2B\44MTT.wav');
           f_V = 30;
           f_UV = 78;
           figure('name','44MTT');
       end
       if f == 8
           file = ('D:\XLTHS\2B\45MDV.wav');
           f_V = 30;
           f_UV = 78;
           figure('name','45MDV');
       end
    %========??c tín hi?u ??u vào======== 
    [y,Fs] = audioread(file);
    N = length(y); %Chi?u dài tín hi?u tính theo m?u
    ts = 1/Fs;%Chu kì l?y m?u
    t_s = 0:ts:(N/Fs-ts); %tr?c th?i gian c?a c? tín hi?u(s)
    
    %Phân khung tín hi?u
    length_f = 0.02; %length_f: ?? dài khung (ms)
    t_f = 0:ts:0.02-ts; %tr?c th?i gian c?a frame
    size_f = round(length_f*Fs); %size_f: S? m?u/khung
    N_f = round(N/size_f); %N_f: S? khung
    time_y = N/Fs;
    t = 0:0.02:(N_f-1)*0.02;
    %========V? ?? th? c?a tín hi?u ??u vào========
    subplot(4,1,1);plot(t_s,y);xlim([0 time_y]);title('Input signal');xlabel('Time(s)');ylabel('Amplitude'); 
    pitchs_V = ACF(y,f_V,size_f);
    %========V? ?? th? c?a 1 Voice frame========
    subplot(4,1,2);plot(t_f,pitchs_V);title('Plot ACF Voice Frame'); ylim([-1 1]);xlabel('Time(s)');ylabel('Amplitude');
    pitchs_UV = ACF(y,f_UV,size_f);
    %========V? ?? th? c?a 1 UnVoice frame========
    subplot(4,1,3);plot(t_f,pitchs_UV);title('Plot ACF UnVoice Frame'); ylim([-1 1]);xlabel('Time(s)');ylabel('Amplitude');
    [arr_F0] = find_F0(y,size_f,Fs,threshold) ; 
    F0mean = mean(arr_F0((arr_F0>=70) & (arr_F0<=400)));
    F0std = std(arr_F0((arr_F0>=70) & (arr_F0<=400)));
    %========V? ???ng Pitch c?a tín hi?u ??u vào========
    subplot(4,1,4);plot(t,arr_F0,'.');xlim([0 time_y]); ylim([0 400]); xlabel('Time(s)');ylabel('Amplitude');
    title({'Plot of F0 of signal',['F0mean= ',num2str(F0mean),',','F0std= ',num2str(F0std)]}); %kèm theo giá tr? mean và std
end



    
    
    
    
    
    
    
    