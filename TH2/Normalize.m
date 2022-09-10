function [Energy, Power,x] = Normalize(Energy,Power,x)
    Energy = Energy./max(Energy);
    Power = Power./max(Power);
    x = x./max(x);
end