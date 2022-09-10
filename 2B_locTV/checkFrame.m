function Frame = checkFrame(amdf,L_Min,L_Max)
%Ham kiem tra khung vo thanh hay huu thanh
%tim cuc tieu trong khoang nua dau khung roi so sanh voi nguong
LMin = 1;
for i = L_Min:ceil((length(amdf)-1)/2)
    if( i <= L_Max)
        if (amdf(i)<amdf(i+1) && amdf(i)<amdf(i-1))
            if (LMin>amdf(i))
                LMin = amdf(i);
            end
        end
    end
end
%Neu la am vo thanh thi co cuc tieu > 0.29
if LMin > 0.28 
    Frame = -1 ;
else
    Frame = 1;
end
end