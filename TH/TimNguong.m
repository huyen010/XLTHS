function [u,v] = TimNguong(n)
% Nhap n de lua chon cac file can tim thong so
if(n==1)
    [y,Fs] = audioread('D:\XLTHS\2B\01MDA.wav');
end
if(n==2)
    [y,Fs] = audioread('D:\XLTHS\2B\02FVA.wav');
end
if(n==3)
    [y,Fs] = audioread('D:\XLTHS\2B\03MAB.wav');
end
if(n==4)
    [y,Fs] = audioread('D:\XLTHS\2B\06FTB.wav');
end
if(n==5)
    [y,Fs] = audioread('D:\XLTHS\2B\30FTN.wav');
end
if(n==6)
    [y,Fs] = audioread('D:\XLTHS\2B\42FQT.wav');
end
if(n==7)
    [y,Fs] = audioread('D:\XLTHS\2B\44MTT.wav');
end
if(n==8)
    [y,Fs] = audioread('D:\XLTHS\2B\45MDV.wav');
end
u= []; v= [];
% cho framesize la so luong mau trong 0.02ms va buoc nhay la 1/2 framesize
FrameSize = Fs*0.02;
SL_Khung = ceil(length(y)/floor(FrameSize/2));
L_Min = round(Fs/450);
L_Max = round(Fs/70);
voice = 1; unvoice = 1;
%chuan hoa acf cho tung khung,nhap cac khoang thoi gian voice va unvoice
%min cua frame unvoice luu vao u
%min cua frame voice luu vao v
for i = 1:SL_Khung
    first = (i-1)*floor(FrameSize/2) + 1; 
    last = min(first + FrameSize - 1, length(y)); 
    frame = y(first:last);
    A_Max = 0;
    [acf] = ACF(frame);
    if(n==1)
        if((first >= 0 && last <= 0.45*Fs)||(first >= 0.81*Fs && last <= 1.53*Fs)|| (first >= 1.85*Fs && last <= 2.69*Fs)||(first >= 2.86*Fs && last <= 3.78*Fs)||(first >= 4.15*Fs && last <= 4.84*Fs))
            A_Max = MaxValue(acf,L_Min,L_Max);
            u(unvoice) = A_Max;
            unvoice = unvoice + 1;
        end
        if((first >= 0.45*Fs && last <= 0.81*Fs)||(first >= 1.53*Fs && last <= 1.85*Fs)|| (first >= 2.69*Fs && last <= 2.86*Fs)||(first >= 3.78*Fs && last <= 4.15*Fs)||(first >= 4.84*Fs && last <= 5.14*Fs))
            A_Max = MaxValue(acf,L_Min,L_Max);
            v(voice) = A_Max;
            voice = voice + 1;
        end
    end
    if(n==2)
        if((first >= 0*Fs && last <= 0.83*Fs)||(first >= 1.37*Fs && last <= 2.09*Fs)|| (first >= 2.6*Fs && last <= 3.57*Fs)||(first >= 4*Fs && last <= 4.76*Fs)||(first >= 5.33*Fs && last <= 6.18*Fs))
            A_Max = MaxValue(acf,L_Min,L_Max);
            u(unvoice) = A_Max;
            unvoice = unvoice + 1;
        end
        if((first >= 0.83*Fs && last <= 1.37*Fs)||(first >= 2.09*Fs && last <= 2.6*Fs)|| (first >= 3.57*Fs && last <= 4*Fs)||(first >= 4.76*Fs && last <= 5.33*Fs)||(first >= 6.18*Fs && last <= 6.68*Fs))
            A_Max = MaxValue(acf,L_Min,L_Max);
            v(voice) = A_Max;
            voice = voice + 1;
        end
    end
    if(n==3)
        if((first >= 0*Fs && last <= 1.03*Fs)||(first >= 1.42*Fs && last <= 2.46*Fs)|| (first >= 2.8*Fs && last <= 4.21*Fs)||(first >= 4.52*Fs && last <= 6.81*Fs)||(first >= 7.14*Fs && last <= 8.22*Fs))
            A_Max = MaxValue(acf,L_Min,L_Max);
            u(unvoice) = A_Max;
            unvoice = unvoice + 1;
        end
        if((first >= 1.03*Fs && last <= 1.42*Fs)||(first >= 2.46*Fs && last <= 2.8*Fs)|| (first >= 4.21*Fs && last <= 4.52*Fs)||(first >= 6.81*Fs && last <= 7.14*Fs)||(first >= 8.22*Fs && last <= 8.5*Fs))
            A_Max = MaxValue(acf,L_Min,L_Max);
            v(voice) = A_Max;
            voice = voice + 1;
        end
    end
    if(n==4)
        if((first >= 0*Fs && last <= 1.52*Fs)||(first >= 1.92*Fs && last <= 3.91*Fs)|| (first >= 4.35*Fs && last <= 6.18*Fs)||(first >= 6.6*Fs && last <= 8.67*Fs)||(first >= 9.14*Fs && last <= 10.94*Fs))
            A_Max = MaxValue(acf,L_Min,L_Max);
            u(unvoice) = A_Max;
            unvoice = unvoice + 1;
        end
        if((first >= 1.52*Fs && last <= 1.92*Fs)||(first >= 3.91*Fs && last <= 4.35*Fs)|| (first >= 6.18*Fs && last <= 6.6*Fs)||(first >= 8.67*Fs && last <= 9.14*Fs)||(first >= 10.94*Fs && last <= 11.33*Fs))
            A_Max = MaxValue(acf,L_Min,L_Max);
            v(voice) = A_Max;
            voice = voice + 1;
        end
    end
     if(n==5)
        if((first >= 0*Fs && last <= 0.59*Fs)||(first >= 0.97*Fs && last <= 1.76*Fs)|| (first >= 2.11*Fs && last <= 3.44*Fs)||(first >= 3.77*Fs && last <= 4.7*Fs)||(first >= 5.13*Fs && last <= 5.96*Fs))
            A_Max = MaxValue(acf,L_Min,L_Max);
            u(unvoice) = A_Max;
            unvoice = unvoice + 1;
        end
        if((first >= 0.59*Fs && last <= 0.97*Fs)||(first >= 1.76*Fs && last <= 2.11*Fs)|| (first >= 3.44*Fs && last <= 3.77*Fs)||(first >= 4.7*Fs && last <= 5.13*Fs)||(first >= 5.96*Fs && last <= 6.28*Fs))
            A_Max = MaxValue(acf,L_Min,L_Max);
            v(voice) = A_Max;
            voice = voice + 1;
        end
     end
     if(n==6)
        if((first >= 0*Fs && last <= 0.46*Fs)||(first >= 0.99*Fs && last <= 1.56*Fs)|| (first >= 2.13*Fs && last <= 2.51*Fs)||(first >= 2.93*Fs && last <= 3.79*Fs)||(first >= 4.38*Fs && last <= 4.77*Fs))
            A_Max = MaxValue(acf,L_Min,L_Max);
            u(unvoice) = A_Max;
            unvoice = unvoice + 1;
        end
        if((first >= 0.46*Fs && last <= 0.99*Fs)||(first >= 1.56*Fs && last <= 2.13*Fs)|| (first >= 2.51*Fs && last <= 2.93*Fs)||(first >= 3.79*Fs && last <= 4.38*Fs)||(first >= 4.77*Fs && last <= 5.22*Fs))
            A_Max = MaxValue(acf,L_Min,L_Max);
            v(voice) = A_Max;
            voice = voice + 1;
        end
     end
     if(n==7)
        if((first >= 0*Fs && last <= 0.93*Fs)||(first >= 1.42*Fs && last <= 2.59*Fs)|| (first >= 3*Fs && last <= 4.71*Fs)||(first >= 5.11*Fs && last <= 6.26*Fs)||(first >= 6.66*Fs && last <= 8.04*Fs))
            A_Max = MaxValue(acf,L_Min,L_Max);
            u(unvoice) = A_Max;
            unvoice = unvoice + 1;
        end
        if((first >=0.93*Fs && last <= 1.42*Fs)||(first >= 2.59*Fs && last <= 3*Fs)|| (first >= 4.71*Fs && last <= 5.11*Fs)||(first >= 6.26*Fs && last <= 6.66*Fs)||(first >= 8.04*Fs && last <= 8.39*Fs))
            A_Max = MaxValue(acf,L_Min,L_Max);
            v(voice) = A_Max;
            voice = voice + 1;
        end
     end
     if(n==8)
        if((first >= 0*Fs && last <= 0.88*Fs)||(first >= 1.34*Fs && last <= 2.35*Fs)|| (first >= 2.82*Fs && last <= 3.76*Fs)||(first >= 4.13*Fs && last <= 5.04*Fs)||(first >= 5.5*Fs && last <= 6.41*Fs))
            A_Max = MaxValue(acf,L_Min,L_Max);
            u(unvoice) = A_Max;
            unvoice = unvoice + 1;
        end
        if((first >= 0.88*Fs && last <= 1.34*Fs)||(first >= 2.35*Fs && last <= 2.82*Fs)|| (first >= 3.76*Fs && last <= 4.13*Fs)||(first >= 5.04*Fs && last <= 5.5*Fs)||(first >= 6.41*Fs && last <= 6.79*Fs))
            A_Max = MaxValue(acf,L_Min,L_Max);
            v(voice) = A_Max;
            voice = voice + 1;
        end
    end
end
end