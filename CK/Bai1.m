%[y, Fs] = audioread('D:\XLTHS\CK\01MDA.wav');
%[y, Fs] = audioread('D:\XLTHS\CK\02FVA.wav');
%[y, Fs] = audioread('D:\XLTHS\CK\03MAB.wav');
%[y, Fs] = audioread('D:\XLTHS\CK\06FTB.wav');
kqchuan1 = [0.59, 0.97, 1.76, 2.11, 3.44, 3.77, 4.7, 5.13, 5.96, 6.28]; % 30FTN
kqchuan2 = [0.46, 0.99, 1.56, 2.13, 2.51, 2.93, 3.79, 4.38, 4.77, 5.22]; % 42FQT
kqchuan3 = [0.93, 1.42, 2.59, 3, 4.71, 5.11, 6.26, 6.66, 8.04, 8.39]; % 44MTT
kqchuan4 = [0.88, 1.34, 2.35, 2.82, 3.76, 4.13, 5.04, 5.5, 6.41, 6.79]; % 45MDV
clc;clear;
for i = 1:8
     if i == 1
         file = ('D:\XLTHS\2B\01MDA.wav');
         figure('name','01MDA');
         timeuv = 1;
         timev = 1.65;
     end
      if i == 2
          file = ('D:\XLTHS\2B\02FVA.wav');
          figure('name','02FVA');
          timeuv = 1.9;
          timev = 2.4;
      end
       if i == 3
           file = ('D:\XLTHS\2B\03MAB.wav');
           figure('name','03MAB');
           timeuv = 1.6;
           timev = 2.6;
       end
       if i == 4
           file = ('D:\XLTHS\2B\06FTB.wav');
           figure('name','06FTB');
           timeuv = 2;
           timev = 4.2;
       end
       if i == 5
           file = ('D:\XLTHS\2B\30FTN.wav');
           figure('name','30FTN');
           timeuv = 1.3;
           timev = 1.9;
       end
       if i == 6
           file = ('D:\XLTHS\2B\42FQT.wav');
           figure('name','42FQT');
           timeuv = 1.3;
           timev = 2;
       end
       if i == 7
           file = ('D:\XLTHS\2B\44MTT.wav');
           figure('name','44MTT');
           timeuv = 1.6;
           timev = 2.8;
       end
       if i == 8
           file = ('D:\XLTHS\2B\45MDV.wav');
           figure('name','45MDV');
           timeuv = 1.6;
           timev = 2.5;
       end
    [y, Fs] = audioread(file);
    t=0:1/Fs:length(y)/Fs;
    t=t(1:end-1);
    subplot(4,1,1);
    plot(t,y); 
    frame_len = round(0.03*Fs);                                   %do dai cua mot khung (don vi: mau)
    frame_shift = round(frame_len/3);
    [f0,stdf0,meanf0] = FindF0byFFT(y,Fs,frame_len,frame_shift);                 %Tim F0 theo tung khung
    subplot(4,1,2);
    plot(f0,'.');                                                                         
    title({'FFT',['meanF0= ',num2str(meanf0),' stdF0= ',num2str(stdf0)]});
    ylabel('Hz');
    %voiceframe
    start = round(timev*Fs);
    finish = start + frame_len;
    frame = y(start:finish);
    P = abs(fft(frame,2^13));
    P1 = P(1:length(P)/2+1);
    subplot(4,1,3);
    plot(P1);
    title({'VoiceFrame'});
    start1 = round(timeuv*Fs);
    finish1 = start1 + frame_len;
    frame1 = y(start1:finish1);
    P2 = abs(fft(frame1,2^13));
    P3 = P2(1:length(P)/2+1);
    subplot(4,1,4);
    title({'UnvoiceFrame'});
    plot(P3);
end
