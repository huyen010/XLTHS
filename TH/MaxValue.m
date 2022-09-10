function max = MaxValue(acf,L_Min,L_Max)
        A_Max = -1;
        for i = L_Min : length(acf)-2
           if(i <= L_Max)
                if (acf(i)>acf(i-1) && acf(i)>acf(i+1))
                    if (A_Max<acf(i))
                        A_Max = acf(i);
                    end
                end
           end
        end
        max = A_Max;
end
