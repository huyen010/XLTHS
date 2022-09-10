clc;clear;
for i = 1:8
     if i == 1
         file = ('D:\XLTHS\2B\01MDA.wav');
         v = 80;
         uv = 15;
         figure('name','01MDA');
     end
      if i == 2
          file = ('D:\XLTHS\2B\02FVA.wav');
          v = 115;
          uv = 15;
          figure('name','02FVA');
      end
       if i == 3
           file = ('D:\XLTHS\2B\03MAB.wav');
           v = 130;
           uv = 15;
           figure('name','03MAB');
       end
       if i == 4
           file = ('D:\XLTHS\2B\06FTB.wav');
           v = 200;
           uv = 15;
           figure('name','06FTB');
       end
       if i == 5
           file = ('D:\XLTHS\2B\30FTN.wav');
           v = 95;
           uv = 15;
           figure('name','30FTN');
       end
       if i == 6
           file = ('D:\XLTHS\2B\42FQT.wav');
           v = 90;
           uv = 15;
           figure('name','42FQT');
       end
       if i == 7
           file = ('D:\XLTHS\2B\44MTT.wav');
           v = 140;
           uv = 15;
           figure('name','44MTT');
       end
       if i == 8
           file = ('D:\XLTHS\2B\45MDV.wav');
           v = 130;
           uv = 15;
           figure('name','45MDV');
       end
    [y,Fs] = audioread(file); % doc tin hieu doc vao tu file
    time = 0 : ( 1/Fs) : (length(y)-1)/Fs;  
    subplot (4,1,1);
    plot(time,y);
    xlabel('second'); ylabel('Magnitude');
    t = 20/1000;                                                                        %do dai cua mot khung lay mau (2000ms)
    FrameSize = t*Fs;                                                               %do dai cua mot khung (don vi: mau)
    [f,t,F0Std,F0Mean] = ValueF0(y,Fs,FrameSize);                     %Tim F0 theo tung khung
    subplot(4,1,2);
    gender = 'nu';
    if(F0Mean <= 150)
        gender = 'nam';
    end
    plot(t,f,'.');                                                                           %ve ket qua
    title(['F0 tao boi AMDF F0Mean =  ',num2str(F0Mean),'  Gioi tinh =  ',gender]);
    xlabel('Thoi gian (s)');
    ylabel('F0 (Hz)');
    frameSize = floor(0.02*Fs);
    UV1 = y(frameSize*uv:frameSize*(uv+1)-1);
    [uv1] = AMDF(UV1);
    t1 = 0 : 1/Fs : (length(uv1)-1)/Fs;
    subplot(4,1,3);
    plot(t1,uv1);
    title('Unvoice');
    V1 = y(frameSize*v:frameSize*(v+1)-1);
    [v1] = AMDF(V1);
    subplot(4,1,4);
    plot(t1,v1);
    title('Voice');
end







