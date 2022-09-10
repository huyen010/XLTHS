function [FFTs] = findFFT(y,timeStart,timeEnd,Fs)
    frame_shift = floor(0.01*Fs);
    frame_len = floor(0.03*Fs);
    numberFrame = floor((timeEnd - timeStart)/frame_shift);
    hammingWD = hamming(frame_len);
    FFTs = [];
    % disp(numberFrame);
    for FrameIndex = 1: numberFrame
        start = (FrameIndex-1)*frame_shift + timeStart +1;
        finish = min(length(y),start+frame_len)-1;
        FSize = start : finish;
        frame = hammingWD.*y(FSize);
        P = abs(fft(frame,1024)); 
        P1 = P(1:length(P)/2);
        FFTs = [FFTs,P1];
    end
    
    FFTs = mean(FFTs,2);
end