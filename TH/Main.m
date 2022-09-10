clc;clear;
%[u,v] = TimNguong(8);
for i = 1:10
     if i == 1
         file = ('D:\XLTHS\2B_locTV\04MHB.wav');
         v = 80;
         uv = 15;
         name = '04MHB';
         gender = 'nam';
     end
      if i == 2
          file = ('D:\XLTHS\2B_locTV\05MVB.wav');
          v = 115;
          uv = 15;
          name = '05MVB';
          gender = 'nam';
      end
       if i == 3
           file = ('D:\XLTHS\2B_locTV\07FTC.wav');
           v = 130;
           uv = 15;
           name = '07FTC';
           gender = 'nu';
       end
       if i == 4
           file = ('D:\XLTHS\2B_locTV\08MLD.wav');
           v = 200;
           uv = 15;
           name = '01MLD';
           gender = 'nam';
       end
       if i == 5
           file = ('D:\XLTHS\2B_locTV\09MPD.wav');
           v = 95;
           uv = 15;
           name = '01MPD';
           gender = 'nam';
       end
       if i == 6
           file = ('D:\XLTHS\2B_locTV\1OMSD.wav');
           v = 90;
           uv = 15;
           name = '10MSD';
           gender = 'nam';
       end
       if i == 7
           file = ('D:\XLTHS\2B_locTV\12FTD.wav');
           v = 140;
           uv = 15;
           name = '12FTD';
           gender = 'nu'
       end
       if i == 8
           file = ('D:\XLTHS\2B_locTV\14FHH.wav');
           v = 130;
           uv = 15; 
           name = '14FHH';
           gender = 'nu'
       end
       if i == 9
           file = ('D:\XLTHS\2B_locTV\16FTH.wav');
           v = 130;
           uv = 15; 
           name = '16FTH';
           gender = 'nu'
       end
       if i == 10
           file = ('D:\XLTHS\2B_locTV\24FTL.wav');
           v = 130;
           uv = 15; 
           name = '24FTL';
           gender = 'nam'
       end
    [y,Fs] = audioread(file); % doc tin hieu doc vao tu file
    t = 20/1000;                                                 %do dai cua mot khung lay mau (2000ms)
    FrameSize = t*Fs;                                            %do dai cua mot khung (don vi: mau)
    [f,t,F0Std,F0Mean] = ValueF0(y,Fs,FrameSize);                     %Tim F0 theo tung khung        
    gioitinh = 'nu'; dcx = 0;
    if(F0Mean < 150)
        gioitinh = 'nam';
    end
    if(gioitinh == gender)
        dcx = dcx + 1;
    end
    fprint(name + 'có F0Mean: '+F0Mean + 'gi?i tính :'+gioitinh);
end







