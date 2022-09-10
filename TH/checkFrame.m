function Frame = checkFrame(amdf,L_Min,L_Max)
%Ham kiem tra khung vo thanh hay huu thanh
%tim cuc tieu trong khoang nua dau khung roi so sanh voi nguong
LMax = 0;
for i = L_Min:length(amdf)-1
    if( i <= L_Max)
        if (amdf(i)>amdf(i+1) && amdf(i)>amdf(i-1))
            if (LMax<amdf(i))
                LMax = amdf(i);
            end
        end
    end
end
LMin = 1;
for i = L_Min:length(amdf)-1
    if( i <= L_Max)
        if (amdf(i)<amdf(i+1) && amdf(i)<amdf(i-1))
            if (LMin>amdf(i))
                LMin = amdf(i);
            end
        end
    end
end
%Neu la am vo thanh thi co cuc tieu > 0.28
if LMax > 0.45 && LMin < -0.2
    Frame = 1 ;
else
    Frame = -1;
end
end