function [centerVectors] = findMeanFFTofNA(id)
        FFTs = [];
        if(id==1)
            for person = 1 : 21
                if(person == 1)
                    file = ('D:\XLTHS\TH2\01MDA\a.wav');
                    start = 0.42;
                    finish = 0.67;
                end
                if(person == 2)
                    file = ('D:\XLTHS\TH2\02FVA\a.wav');
                    start = 0.62;
                    finish = 0.99;
                end
                if(person == 3)
                    file = ('D:\XLTHS\TH2\03MAB\a.wav');
                    start = 0.85;
                    finish = 1.19;
                end
                if(person == 4)
                    file = ('D:\XLTHS\TH2\04MHB\a.wav');
                    start = 0.23;
                    finish = 0.6;
                end
                if(person == 5)
                    file = ('D:\XLTHS\TH2\05MVB\a.wav');
                    start = 0.65;
                    finish = 1.1;
                end
                if(person == 6)
                    file = ('D:\XLTHS\TH2\06FTB\a.wav');
                    start = 0.99;
                    finish = 1.36;
                end
                if(person == 7)
                    file = ('D:\XLTHS\TH2\07FTC\a.wav');
                    start = 0.46;
                    finish = 0.79;
                end
                if(person == 8)
                    file = ('D:\XLTHS\TH2\08MLD\a.wav');
                    start = 0.63;
                    finish = 1.02;
                end
                if(person == 9)
                    file = ('D:\XLTHS\TH2\09MPD\a.wav');
                    start = 0.19;
                    finish = 0.57;
                end
                if(person == 10)
                    file = ('D:\XLTHS\TH2\10MSD\a.wav');
                    start = 0.71;
                    finish = 0.98;
                end
                if(person == 11)
                    file = ('D:\XLTHS\TH2\11MVD\a.wav');
                    start = 0.54;
                    finish = 0.82;
                end
                if(person == 12)
                    file = ('D:\XLTHS\TH2\12FTD\a.wav');
                    start = 0.79;
                    finish = 1.22;
                end
                if(person == 13)
                    file = ('D:\XLTHS\TH2\14FHH\a.wav');
                    start = 0.86;
                    finish = 1.32;
                end
                if(person == 14)
                    file = ('D:\XLTHS\TH2\15MMH\a.wav');
                    start = 0.33;
                    finish = 0.75;
                end
                if(person == 15)
                    file = ('D:\XLTHS\TH2\16FTH\a.wav');
                    start = 0.91;
                    finish = 1.3;
                end
                if(person == 16)
                    file = ('D:\XLTHS\TH2\17MTH\a.wav');
                    start = 0.7;
                    finish = 1.03;
                end
                if(person == 17)
                    file = ('D:\XLTHS\TH2\18MNK\a.wav');
                    start = 0.73;
                    finish = 1.15;
                end
                if(person == 18)
                    file = ('D:\XLTHS\TH2\19MXK\a.wav');
                    start = 0.65;
                    finish = 1.14;
                end
                if(person == 19)
                    file = ('D:\XLTHS\TH2\20MVK\a.wav');
                    start = 0.64;
                    finish = 0.87;
                end
                if(person == 20)
                    file = ('D:\XLTHS\TH2\21MTL\a.wav');
                    start = 0.42;
                    finish = 0.67;
                end
                if(person == 21)
                    file = ('D:\XLTHS\TH2\22MHL\a.wav');
                    start = 0.42;
                    finish = 0.68;
                end
                [y,Fs] = audioread(file);
                timeStart = round(start*Fs);
                timeEnd = round(finish*Fs);
                
                [T1,T2] = ThirdVoice(timeStart,timeEnd);
                [ffts] = findFFT(y,T1,T2,Fs);
                FFTs = [FFTs,ffts];
            end
            [centerVectors] = mean(FFTs,2);
        end
        if(id==2)
            for person = 1 : 21
                if(person == 1)
                    file = ('D:\XLTHS\TH2\01MDA\e.wav');
                    start = 0.37;
                    finish = 0.64;
                end
                if(person == 2)
                    file = ('D:\XLTHS\TH2\02FVA\e.wav');
                     start = 0.44;                   
                     finish = 0.93;
                end
                if(person == 3)
                    file = ('D:\XLTHS\TH2\03MAB\e.wav');
                    start = 0.63;
                    finish = 0.95;
                end
                if(person == 4)
                    file = ('D:\XLTHS\TH2\04MHB\e.wav');
                    start = 0.08;
                    finish =0.45;
                end
                if(person == 5)
                    file = ('D:\XLTHS\TH2\05MVB\e.wav');
                    start = 0.53;
                    finish = 0.94;
                end
                if(person == 6)
                    file = ('D:\XLTHS\TH2\06FTB\e.wav');
                    start = 1.08;
                    finish = 1.5;
                end
                if(person == 7)
                    file = ('D:\XLTHS\TH2\07FTC\e.wav');
                    start = 0.54; 
                    finish = 0.88;
                end
                if(person == 8)
                    file = ('D:\XLTHS\TH2\08MLD\e.wav');
                    start = 0.68;
                    finish = 0.95;
                end
                if(person == 9)
                    file = ('D:\XLTHS\TH2\09MPD\e.wav');
                    start = 0.19;
                    finish = 0.46;
                end
                if(person == 10)
                    file = ('D:\XLTHS\TH2\10MSD\e.wav');
                    start = 0.70;
                    finish = 0.91;
                end
                if(person == 11)
                    file = ('D:\XLTHS\TH2\11MVD\e.wav');
                    start = 0.56;
                    finish = 0.84;
                end
                if(person == 12)
                    file = ('D:\XLTHS\TH2\12FTD\e.wav');
                    start = 0.62;
                    finish = 1.01;
                end
                if(person == 13)
                    file = ('D:\XLTHS\TH2\14FHH\e.wav');
                    start = 0.84;
                    finish = 1.26;
                end
                if(person == 14)
                    file = ('D:\XLTHS\TH2\15MMH\e.wav');
                    start = 0.23; 
                    finish = 0.67;
                end
                if(person == 15)
                    file = ('D:\XLTHS\TH2\16FTH\e.wav');
                    start = 0.91;
                    finish = 1.25;
                end
                if(person == 16)
                    file = ('D:\XLTHS\TH2\17MTH\e.wav');
                    start = 0.57;
                    finish = 0.91;
                end
                if(person == 17)
                    file = ('D:\XLTHS\TH2\18MNK\e.wav');
                    start = 0.74;
                    finish = 1.14;
                end
                if(person == 18)
                    file = ('D:\XLTHS\TH2\19MXK\e.wav');
                    start = 0.56;
                    finish = 0.98;
                end
                if(person == 19)
                    file = ('D:\XLTHS\TH2\20MVK\e.wav');
                    start = 0.57 ;
                    finish = 0.78;
                end
                if(person == 20)
                    file = ('D:\XLTHS\TH2\21MTL\e.wav');
                    start = 0.51; 
                    finish = 0.75;
                end
                if(person == 21)
                    file = ('D:\XLTHS\TH2\22MHL\e.wav');
                    start = 0.43;
                    finish = 0.67;
                end
                [y,Fs] = audioread(file);
                timeStart = round(start*Fs);
                timeEnd = round(finish*Fs);
                [T1,T2] = ThirdVoice(timeStart,timeEnd);
                [ffts] = findFFT(y,T1,T2,Fs);
                FFTs = [FFTs,ffts];
            end
            [centerVectors] = mean(FFTs,2);
        end
        if(id==3)
            for person = 1 : 21
               	if(person == 1)
                    file = ('D:\XLTHS\TH2\01MDA\i.wav');
                    start = 0.49;
                    finish = 0.71;
                end
                if(person == 2)
                    file = ('D:\XLTHS\TH2\02FVA\i.wav');
                    start = 0.47; 
                    finish = 0.9;
                end
                if(person == 3)
                    file = ('D:\XLTHS\TH2\03MAB\i.wav');
                    start = 0.78;
                    finish = 1.1;
                end
                if(person == 4)
                    file = ('D:\XLTHS\TH2\04MHB\i.wav');
                    start = 0.08; 
                    finish = 0.38;
                end
                if(person == 5)
                    file = ('D:\XLTHS\TH2\05MVB\i.wav');
                    start = 0.72;
                    finish = 1.05;
                end
                if(person == 6)
                    file = ('D:\XLTHS\TH2\06FTB\i.wav');
                    start = 0.91;
                    finish = 1.26;
                end
                if(person == 7)
                    file = ('D:\XLTHS\TH2\07FTC\i.wav');
                    start = 0.49;
                    finish =0.78;
                end
                if(person == 8)
                    file = ('D:\XLTHS\TH2\08MLD\i.wav');
                    start = 0.633;
                    finish = 0.89;
                end
                if(person == 9)
                    file = ('D:\XLTHS\TH2\09MPD\i.wav');
                    start = 0.37; 
                    finish = 0.66;
                end
                if(person == 10)
                    file = ('D:\XLTHS\TH2\10MSD\i.wav');
                    start = 0.568;
                    finish = 0.72;
                end
                if(person == 11)
                    file = ('D:\XLTHS\TH2\11MVD\i.wav');
                    start = 0.69;
                    finish = 0.94;
                end
                if(person == 12)
                    file = ('D:\XLTHS\TH2\12FTD\i.wav');
                    start = 0.68;
                    finish = 1.07;
                end
                if(person == 13)
                    file = ('D:\XLTHS\TH2\14FHH\i.wav');
                    start = 1.01;
                    finish = 1.38;
                end
                if(person == 14)
                    file = ('D:\XLTHS\TH2\15MMH\i.wav');
                    start = 0.28;
                    finish = 0.71;
                end
                if(person == 15)
                    file = ('D:\XLTHS\TH2\16FTH\i.wav');
                    start = 0.79;
                    finish = 1.09;
                end
                if(person == 16)
                    file = ('D:\XLTHS\TH2\17MTH\i.wav');
                    start = 0.69;
                    finish = 0.99;
                end
                if(person == 17)
                    file = ('D:\XLTHS\TH2\18MNK\i.wav');
                    start = 0.73;
                    finish = 1.24;
                end
                if(person == 18)
                    file = ('D:\XLTHS\TH2\19MXK\i.wav');
                    start = 0.65;
                    finish = 1.04;
                end
                if(person == 19)
                    file = ('D:\XLTHS\TH2\20MVK\i.wav');
                    start = 0.71;
                    finish = 0.92 ;
                end
                if(person == 20)
                    file = ('D:\XLTHS\TH2\21MTL\i.wav');
                    start = 0.46;
                    finish = 0.73;
                end
                if(person == 21)
                    file = ('D:\XLTHS\TH2\22MHL\i.wav');
                    start = 0.54;
                    finish = 0.79 ;
                end
                [y,Fs] = audioread(file);
                timeStart = round(start*Fs);
                timeEnd = round(finish*Fs);
                [T1,T2] = ThirdVoice(timeStart,timeEnd);
                [ffts] = findFFT(y,T1,T2,Fs);
                FFTs = [FFTs,ffts];
            end
            [centerVectors] = mean(FFTs,2);
        end
        if(id==4)
            for person = 1 : 21
                if(person == 1)
                    file = ('D:\XLTHS\TH2\01MDA\o.wav');
                    start = 0.43;
                    finish = 0.68;
                end
                if(person == 2)
                    file = ('D:\XLTHS\TH2\02FVA\o.wav');
                    start = 0.44;
                    finish = 0.84;
                end
                if(person == 3)
                    file = ('D:\XLTHS\TH2\03MAB\o.wav');
                    start = 1.28;
                    finish = 1.6;
                end
                if(person == 4)
                    file = ('D:\XLTHS\TH2\04MHB\o.wav');
                    start = 0.08;
                    finish = 0.43;
                end
                if(person == 5)
                    file = ('D:\XLTHS\TH2\05MVB\o.wav');
                    start = 0.6;
                    finish = 1.04;
                end
                if(person == 6)
                    file = ('D:\XLTHS\TH2\06FTB\o.wav');
                    start = 1.09;
                    finish = 1.47;
                end
                if(person == 7)
                    file = ('D:\XLTHS\TH2\07FTC\o.wav');
                    start = 0.58;
                    finish = 0.86;
                end
                if(person == 8)
                    file = ('D:\XLTHS\TH2\08MLD\o.wav');
                    start = 0.67;
                    finish = 0.95;
                end
                if(person == 9)
                    file = ('D:\XLTHS\TH2\09MPD\o.wav');
                    start = 0.3;
                    finish = 0.61;
                end
                if(person == 10)
                    file = ('D:\XLTHS\TH2\10MSD\o.wav');
                    start = 0.64;
                    finish = 0.87;
                end
                if(person == 11)
                    file = ('D:\XLTHS\TH2\11MVD\o.wav');
                    start = 0.77;
                    finish = 1.05;
                end
                if(person == 12)
                    file = ('D:\XLTHS\TH2\12FTD\o.wav');
                    start = 0.63;
                    finish = 1.06;
                end
                if(person == 13)
                    file = ('D:\XLTHS\TH2\14FHH\o.wav');
                    start = 0.67;
                    finish = 1.07;
                end
                if(person == 14)
                    file = ('D:\XLTHS\TH2\15MMH\o.wav');
                    start = 0.35;
                    finish = 0.72;
                end
                if(person == 15)
                    file = ('D:\XLTHS\TH2\16FTH\o.wav');
                    start = 0.82; 
                    finish = 1.18;
                end
                if(person == 16)
                    file = ('D:\XLTHS\TH2\17MTH\o.wav');
                    start =  0.70;
                    finish =1.01;
                end
                if(person == 17)
                    file = ('D:\XLTHS\TH2\18MNK\o.wav');
                    start = 0.71;
                    finish = 1.24 ;
                end
                if(person == 18)
                    file = ('D:\XLTHS\TH2\19MXK\o.wav');
                    start = 0.64;
                    finish = 1.05;
                end
                if(person == 19)
                    file = ('D:\XLTHS\TH2\20MVK\o.wav');
                    start = 0.62;
                    finish = 0.84;
                end
                if(person == 20)
                    file = ('D:\XLTHS\TH2\21MTL\o.wav');
                    start = 0.48;
                    finish = 0.74;
                end
                if(person == 21)
                    file = ('D:\XLTHS\TH2\22MHL\o.wav');
                    start = 0.36;
                    finish = 0.60;
                end
                [y,Fs] = audioread(file);
                timeStart = round(start*Fs);
                timeEnd = round(finish*Fs);
                [T1,T2] = ThirdVoice(timeStart,timeEnd);
                [ffts] = findFFT(y,T1,T2,Fs);
                FFTs = [FFTs,ffts];
            end
            [centerVectors] = mean(FFTs,2);
        end
        if(id==5)
            for person = 1 : 21
                if(person == 1)
                    file = ('D:\XLTHS\TH2\01MDA\u.wav');
                    start = 0.41;
                    finish = 0.63;
                end
                if(person == 2)
                    file = ('D:\XLTHS\TH2\02FVA\u.wav');
                    start = 0.51;
                    finish = 0.89;
                end
                if(person == 3)
                    file = ('D:\XLTHS\TH2\03MAB\u.wav');
                    start = 0.6;
                    finish = 0.84;
                end
                if(person == 4)
                    file = ('D:\XLTHS\TH2\04MHB\u.wav');
                    start = 0.04;
                    finish = 0.41;
                end
                if(person == 5)
                    file = ('D:\XLTHS\TH2\05MVB\u.wav');
                    start = 0.83;
                    finish = 1.18;
                end
                if(person == 6)
                    file = ('D:\XLTHS\TH2\06FTB\u.wav');
                    start = 0.93;
                    finish = 1.24;
                end
                if(person == 7)
                    file = ('D:\XLTHS\TH2\07FTC\u.wav');
                    start = 0.36;
                    finish = 0.65;
                end
                if(person == 8)
                    file = ('D:\XLTHS\TH2\08MLD\u.wav');
                    start = 0.69;
                    finish = 0.91;
                end
                if(person == 9)
                    file = ('D:\XLTHS\TH2\09MPD\u.wav');
                    start = 0.42;
                    finish = 0.71;
                end
                if(person == 10)
                    file = ('D:\XLTHS\TH2\10MSD\u.wav');
                    start = 0.6;
                    finish = 0.79;
                end
                if(person == 11)
                    file = ('D:\XLTHS\TH2\11MVD\u.wav');
                    start = 0.63;
                    finish = 0.91;
                end
                if(person == 12)
                    file = ('D:\XLTHS\TH2\12FTD\u.wav');
                    start = 0.70;
                    finish = 1.09;
                end
                if(person == 13)
                    file = ('D:\XLTHS\TH2\14FHH\u.wav');
                    start = 0.38;
                    finish = 0.72;
                end
                if(person == 14)
                    file = ('D:\XLTHS\TH2\15MMH\u.wav');
                    start = 0.29;
                    finish = 0.67;
                end
                if(person == 15)
                    file = ('D:\XLTHS\TH2\16FTH\u.wav');
                    start = 0.95;
                    finish = 1.24;
                end
                if(person == 16)
                    file = ('D:\XLTHS\TH2\17MTH\u.wav');
                    start = 0.70;
                    finish = 1.03;
                end
                if(person == 17)
                    file = ('D:\XLTHS\TH2\18MNK\u.wav');
                    start = 0.67;
                    finish = 1.07;
                end
                if(person == 18)
                    file = ('D:\XLTHS\TH2\19MXK\u.wav');
                    start = 0.65;
                    finish = 0.98;
                end
                if(person == 19)
                    file = ('D:\XLTHS\TH2\20MVK\u.wav');
                    start = 0.43;
                    finish = 0.65;
                end
                if(person == 20)
                    file = ('D:\XLTHS\TH2\21MTL\u.wav');
                    start = 0.53;
                    finish = 0.73;
                end
                if(person == 21)
                    file = ('D:\XLTHS\TH2\22MHL\u.wav');
                    start = 0.49;
                    finish = 0.71;
                end
               [y,Fs] = audioread(file);
                timeStart = round(start*Fs);
                timeEnd = round(finish*Fs);
                [T1,T2] = ThirdVoice(timeStart,timeEnd);
                [ffts] = findFFT(y,T1,T2,Fs);
                FFTs = [FFTs,ffts];
            end
            [centerVectors] = mean(FFTs,2);
        end

end