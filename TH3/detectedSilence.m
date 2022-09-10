function [pointstart, pointend] = detectedSilence(fileinput)
        [x, fs] = audioread(fileinput);
        [Energy, Power, f_size, lenF] = Short_time_Energy(x,fs,0.03, 0.02);
        ThresholdSTE = 0.3;
         [Energy, Power, x] = Normalize(Energy, Power, x);
        vowel = Remove_Silence(x, lenF, Power, ThresholdSTE, f_size, fs);
        pointstart = vowel(1);
        pointend = vowel(2);
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    function [Energy, Power, f_size, lenF] = Short_time_Energy(x,fs,fd, foverlap)
    f_size = round(fd.*fs); % kich thuoc khung
    f_overlap = round(foverlap.*fs);
    n = length(x); %do dai tin hieu
    lenF = floor((n-f_overlap)./(f_size-f_overlap));% do dai frame, so frame
    temp = 0;
    for i = 1: lenF
         if temp + f_size - f_overlap<= n
            frame= 0;
            for j = temp + 1:temp + f_size % xet tung frame
              frame = frame + abs(x(j).^2);%tinh nang luong tren tung frame
            end
            Energy(temp + 1: temp + f_size) = frame;
            Power(i) = frame; %gán tong nang luong cua frame vào Power
            temp = round(temp + f_size - f_overlap);
         end 
    end
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    function [speech] = Remove_Silence(x,lenF,Power,ThresholdSTE, f_size, fs)
        f_overlap = 0.02;
        voice = zeros(1,lenF); 
        for i =1 : lenF 
            if Power(i) > ThresholdSTE
                voice(i) = 1;
            else
                voice(i) = 0;
            end
        end
        n_len = 0;
        vowel  =[]; 
        j = 1;
       for i = 1: lenF-1
           if i == 1
               n_len = n_len + f_size/fs;
           else  
               n_len = n_len + f_size/fs -f_overlap;
           end
            if (voice(i) == 0 && voice(i+1)==1)
                vowel(2*j -1) = n_len;
                j = j + 1;
            end
        end
        j = 1;
        n_len = 0;
        for i = 1: lenF-1
           if i == 1
               n_len = n_len + f_size/fs;
           else  
               n_len = n_len + f_size/fs -f_overlap;
           end
            if (voice(i) == 1 && voice(i+1) == 0)
                vowel(2*j) = n_len;
                j = j + 1;
            end
        end
        check_speech = ones(1,length(vowel));
        for i = 2:2:length(vowel)-1
            if abs(vowel(i+1) - vowel(i)) <0.3
                check_speech(i)= 0;
                check_speech(i+1)= 0;
            end
        end
        speech = [];
        j = 1;
        for i = 1 : length(vowel)
            if check_speech(i) == 1
                speech(j) = vowel(i);
                j = j+1;
            end
        end
end