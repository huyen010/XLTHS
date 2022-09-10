function [F0,F0Std,F0Mean] = FindF0byFFT(y,fs,frame_len,frame_shift)
    numberFrame = floor(length(y)/frame_shift -2);
    hammingWD = hamming(frame_len);
    F0 = zeros(1,numberFrame);
    for FrameIndex = 1: numberFrame
        start = (FrameIndex-1)*frame_shift +1;
        finish = ((FrameIndex-1)*frame_shift+frame_len);
        FSize = start : finish;
        frame = hammingWD.*y(FSize);
        P = abs(fft(frame,2^14)); 
        P1 = P(1:length(P)/2+1);
        V = linspace(0,fs/2,length(P1));
       [peak,id] = findpeaks(P1,'MinPeakHeight',2);
        if(length(peak)>=3)
            space1 = V(id(1));
            space3 = V(id(3))-V(id(2));
            space2 = V(id(2))-V(id(1));
            tbc = 3;
            if(space1 < 70) || (space1 > 400)
                space1 = 0;
                tbc = tbc - 1;
            end
            if(space2 < 70) || (space2 > 400)
                space2 = 0;
                tbc = tbc -1 ;
            end
            if(space3 < 70) || (space2 > 400)
                space3 = 0;
                tbc = tbc - 1;
            end
            if(tbc == 0)
                F0(FrameIndex) = 0;
            else
                F0(FrameIndex) = (space1 + space2 + space3)/tbc;
            end
        end
%             value = 0;
%             index = 1;
%             space = 0;
%             for i = 1 : length(peak)
%                 if(V(id(i))- value > 70) && (V(id(i))-value < 400)
%                     space(index) = V(id(i))-value;
%                     index = index + 1;
%                     value = V(id(i));
%                     if(length(space) == 4)
%                         break
%                     end
%                 end
%             end
%             tbc = 0;
%             if(length(space)==1)&&(space == 0)
%                 F0(FrameIndex) = 0;
%             else
%                 for i = 1 : length(space)
%                     tbc = tbc + space(i);
%                 end
%                 F0(FrameIndex) = tbc/length(space);
%             end
%          end
        
    end
    FF=nonzeros(F0);
    FF = FindMed(FF,9);
    F0Std = std(FF);
    F0Mean = mean(FF);
    F0 = FindMed(F0,9);
end