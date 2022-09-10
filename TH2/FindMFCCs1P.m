function centerVectors = FindMFCCs1P(file, start, finish, N)
    [y,fs] = audioread(file);
    timeStart = round(start*fs);
    timeEnd = round(finish*fs);
    tStart = timeStart + floor((timeEnd - timeStart)/3);
    tEnd = timeStart + 2*floor((timeEnd - timeStart)/3);
    signal = y(tStart:tEnd);
    mfccs = v_melcepst(signal, fs, 'E', N, floor(3*log(fs)), 0.03*fs, 0.01*fs);
    [centerVectors] = mean(mfccs);
end