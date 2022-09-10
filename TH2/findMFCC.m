function [MFCCs,id] = findMFCC(y,timeStart,timeEnd,Fs,index,N)
    frame = y(timeStart : timeEnd);
    mfccs = [];
        if(N==13)
            mfccs = v_melcepst(frame, Fs, 'E', 12, floor(3*log(Fs)), 0.03*Fs, 0.01*Fs);
        end
        if(N==26)
            mfccs = v_melcepst(frame, Fs, 'E', 25, floor(3*log(Fs)), 0.03*Fs, 0.01*Fs);
        end
        if(N==39)
            mfccs = v_melcepst(frame, Fs, 'E', 38, floor(3*log(Fs)), 0.03*Fs, 0.01*Fs);
        end
    id = index;
    MFCCs = mean(mfccs,1);
end
    
    
    
