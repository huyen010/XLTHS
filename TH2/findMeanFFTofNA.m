function [centerVectors] = findMeanFFTofNA(id, K)
        FFTs = [];
        listfile = [ "D:\XLTHS\TH2\01MDA\"
    "D:\XLTHS\TH2\02FVA\"
    "D:\XLTHS\TH2\03MAB\"
    "D:\XLTHS\TH2\04MHB\"
    "D:\XLTHS\TH2\05MVB\"
    "D:\XLTHS\TH2\06FTB\"
    "D:\XLTHS\TH2\07FTC\"
    "D:\XLTHS\TH2\08MLD\"
    "D:\XLTHS\TH2\09MPD\"
    "D:\XLTHS\TH2\10MSD\"
    "D:\XLTHS\TH2\11MVD\"
    "D:\XLTHS\TH2\12FTD\"
    "D:\XLTHS\TH2\14FHH\"
    "D:\XLTHS\TH2\15MMH\"
    "D:\XLTHS\TH2\16FTH\"
    "D:\XLTHS\TH2\17MTH\"
    "D:\XLTHS\TH2\18MNK\"
    "D:\XLTHS\TH2\19MXK\"
    "D:\XLTHS\TH2\20MVK\"
    "D:\XLTHS\TH2\21MTL\"
    "D:\XLTHS\TH2\22MHL\"];
        if(id==1)
            for person = 1 : length(listfile)
                file = listfile(person)+ 'a.wav';
                [y,Fs] = audioread(file);
                [start,finish] = detectedSilence(file);
                timeStart = round(start*Fs);
                timeEnd = round(finish*Fs);
                [T1,T2] = ThirdVoice(timeStart,timeEnd);
                [ffts] = findFFT(y,T1,T2,Fs);
                FFTs = [FFTs,ffts];
            end
             [centerVectors] = mean(FFTs,2);
            %[centerVectors] = mean(FFTs);
        end
        if(id==2)
             for person = 1 : length(listfile)
                file = listfile(person)+ 'e.wav';
                [y,Fs] = audioread(file);
                [start,finish] = detectedSilence(file);
                timeStart = round(start*Fs);
                timeEnd = round(finish*Fs);
                [T1,T2] = ThirdVoice(timeStart,timeEnd);
                [ffts] = findFFT(y,T1,T2,Fs);
                FFTs = [FFTs,ffts];
            end
             [centerVectors] = mean(FFTs,2);
        end
        if(id==3)
             for person = 1 : length(listfile)
                file = listfile(person)+ 'i.wav';
                [y,Fs] = audioread(file);
                [start,finish] = detectedSilence(file);
                timeStart = round(start*Fs);
                timeEnd = round(finish*Fs);
                [T1,T2] = ThirdVoice(timeStart,timeEnd);
                [ffts] = findFFT(y,T1,T2,Fs);
                FFTs = [FFTs,ffts];
            end
             [centerVectors] = mean(FFTs,2);
        end
        if(id==4)
            for person = 1 : length(listfile)
                file = listfile(person)+ 'o.wav';
                [y,Fs] = audioread(file);
                [start,finish] = detectedSilence(file);
                timeStart = round(start*Fs);
                timeEnd = round(finish*Fs);
              [T1,T2] = ThirdVoice(timeStart,timeEnd);
                [ffts] = findFFT(y,T1,T2,Fs);
                FFTs = [FFTs,ffts];
            end
             [centerVectors] = mean(FFTs,2);
        end
        if(id==5)
             for person = 1 : length(listfile)
                file = listfile(person)+ 'u.wav';
                [y,Fs] = audioread(file);
                [start,finish] = detectedSilence(file);
                timeStart = round(start*Fs);
                timeEnd = round(finish*Fs);
                [T1,T2] = ThirdVoice(timeStart,timeEnd);
                [ffts] = findFFT(y,T1,T2,Fs);
                FFTs = [FFTs,ffts];
            end
             [centerVectors] = mean(FFTs,2);
            %[centerVectors] = mean(FFTs);
        end
        
end