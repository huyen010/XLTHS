clc;clear;
%[u,v] = TimNguong(8);
dcx = 0;
for i = 1:10
     if i == 1
         file = ('D:\XLTHS\2B_locTV\04MHB.wav');
         name = '04MHB';
         gender = 'nam';
     end
      if i == 2
          file = ('D:\XLTHS\2B_locTV\05MVB.wav');
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
           name = '08MLD';
           gender = 'nam';
       end
       if i == 5
           file = ('D:\XLTHS\2B_locTV\09MPD.wav');
           name = '09MPD';
           gender = 'nam';
       end
       if i == 6
           file = ('D:\XLTHS\2B_locTV\10MSD.wav');
           name = '10MSD';
           gender = 'nam';
       end
       if i == 7
           file = ('D:\XLTHS\2B_locTV\12FTD.wav');
           name = '12FTD';
           gender = 'nu';
       end
       if i == 8
           file = ('D:\XLTHS\2B_locTV\14FHH.wav');
           v = 130;
           uv = 15; 
           name = '14FHH';
           gender = 'nu';
       end
       if i == 9
           file = ('D:\XLTHS\2B_locTV\16FTH.wav');
           name = '16FTH';
           gender = 'nu';
       end
       if i == 10
           file = ('D:\XLTHS\2B_locTV\24FTL.wav');
           name = '24FTL';
           gender = 'nu';
       end
    [y,Fs] = audioread(file); % doc tin hieu doc vao tu file
    t = 20/1000;                                                 %do dai cua mot khung lay mau (2000ms)
    FrameSize = t*Fs;                                            %do dai cua mot khung (don vi: mau)
    [f,t,F0Std,F0Mean] = ValueF0(y,Fs,FrameSize);                     %Tim F0 theo tung khung        
    gioitinh = 'nu'; 
    if(F0Mean < 150)
        gioitinh = 'nam';
    end
    if(strcmp(gioitinh,gender)==1)
        dcx = dcx + 1;
    end
    formatSpec = '%s co F0Mean %f va gioi tinh %s\n';
    fprintf(formatSpec,name,F0Mean,gioitinh);
end

fprintf('Thuat toan co do chinh xac %d/10',dcx);









