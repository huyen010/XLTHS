function min = MinValue(amdf,L_Min,L_Max)
        A_Min = 1;
        for i = L_Min : ceil((length(amdf)-1)/2)
           if(i <= L_Max)
                if (amdf(i)<amdf(i-1) && amdf(i)<amdf(i+1))
                    if (A_Min>amdf(i))
                        A_Min = amdf(i);
                    end
                end
           end
        end
        min = A_Min;
end
