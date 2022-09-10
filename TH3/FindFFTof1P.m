function [centerVectors] = FindFFTof1P(file, start, finish)
    [y,Fs] = audioread(file);
    timeStart = round(start*Fs);
    timeEnd = round(finish*Fs);
    tStart = timeStart + floor((timeEnd - timeStart)/3);
    tEnd = timeStart + 2*floor((timeEnd - timeStart)/3);    
    ffts = findFFT(y,tStart,tEnd,Fs);
    centerVectors = ffts;
end