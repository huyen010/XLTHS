function [T1,T2] = ThirdVoice(timeStart,timeEnd)
    TB = floor((timeEnd - timeStart)/3);
    T1 = timeStart + TB;
    T2 = timeEnd - TB;
end

