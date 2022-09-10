function [u,v] = TimNguong(n)
% Nhap n de lua chon cac file can tim thong so
if(n==1)
    [y,Fs] = audioread('studio_M1.wav');
end
if(n==2)
    [y,Fs] = audioread('studio_F1.wav');
end
if(n==3)
    [y,Fs] = audioread('phone_M1.wav');
end
if(n==4)
    [y,Fs] = audioread('phone_F1.wav');
end
u= []; v= [];
% cho framesize la so luong mau trong 0.02ms va buoc nhay la 1/2 framesize
FrameSize = Fs*0.02;
SL_Khung = ceil(length(y)/floor(FrameSize/2));
L_Min = round(Fs/450);
L_Max = round(Fs/70);
voice = 1; unvoice = 1;
%chuan hoa amdf cho tung khung,nhap cac khoang thoi gian voice va unvoice
%min cua frame unvoice luu vao u
%min cua frame voice luu vao v
for i = 1:SL_Khung
    first = (i-1)*floor(FrameSize/2) + 1; 
    last = min(first + FrameSize - 1, length(y)); 
    frame = y(first:last);
    A_Min = 0;
    [amdf] = AMDF(frame);
    if(n==1)
        if((first >= 0.87*Fs && last <= 0.94*Fs)||(first >= 1.26*Fs && last <= 1.33*Fs)|| (first >= 1.59*Fs && last <= 1.66*Fs)||(first >= 1.78*Fs && last <= 1.82*Fs))
            A_Min = MinValue(amdf,L_Min,L_Max);
            u(unvoice) = A_Min;
            unvoice = unvoice + 1;
        end
        if((first >= 0.94*Fs && last <= 1.26*Fs)||(first >= 1.33*Fs && last <= 1.59*Fs)|| (first >= 1.66*Fs && last <= 1.78*Fs)||(first >= 1.82*Fs && last <= 2.06*Fs))
            A_Min = MinValue(amdf,L_Min,L_Max);
            v(voice) = A_Min;
            voice = voice + 1;
        end
    end
    if(n==2)
        if((first >= 0.68*Fs && last <= 0.7*Fs)||(first >= 1.1*Fs && last <= 1.13*Fs)|| (first >= 1.22*Fs && last <= 1.27*Fs)||(first >= 1.65*Fs && last <= 1.70*Fs)||(first >= 1.76*Fs && last <= 1.79*Fs)||(first >= 1.86*Fs && last <= 1.92*Fs))
            A_Min = MinValue(amdf,L_Min,L_Max);
            u(unvoice) = A_Min;
            unvoice = unvoice + 1;
        end
        if((first >= 0.7*Fs && last <= 1.1*Fs)||(first >= 1.13*Fs && last <= 1.22*Fs)|| (first >= 1.27*Fs && last <= 1.65*Fs)||(first >= 1.7*Fs && last <= 1.76*Fs)||(first >= 1.79*Fs && last <= 1.86*Fs)||(first >= 1.92*Fs && last <= 2.15*Fs))
            A_Min = MinValue(amdf,L_Min,L_Max);
            v(voice) = A_Min;
            voice = voice + 1;
        end
    end
    if(n==3)
        if((first >= 1.39*Fs && last <= 1.50*Fs)||(first >= 1.69*Fs && last <= 1.79*Fs)|| (first >= 2.78*Fs && last <= 2.86*Fs)||(first >= 2.93*Fs && last <= 3.1*Fs)||(first >= 3.29*Fs && last <= 3.45*Fs))
            A_Min = MinValue(amdf,L_Min,L_Max);
            u(unvoice) = A_Min;
            unvoice = unvoice + 1;
        end
        if((first >= 0.46*Fs && last <= 1.39*Fs)||(first >= 1.50*Fs && last <= 1.69*Fs)|| (first >= 1.79*Fs && last <= 2.78*Fs)||(first >= 2.86*Fs && last <= 2.93*Fs)||(first >= 3.1*Fs && last <= 3.29*Fs)||(first >= 3.45*Fs && last <= 3.52*Fs))
            A_Min = MinValue(amdf,L_Min,L_Max);
            v(voice) = A_Min;
            voice = voice + 1;
        end
    end
    if(n==4)
        if((first >= 1.14*Fs && last <= 1.21*Fs)||(first >= 1.35*Fs && last <= 1.45*Fs)|| (first >= 1.60*Fs && last <= 1.83*Fs)||(first >= 2.20*Fs && last <= 2.28*Fs)||(first >= 2.35*Fs && last <= 2.40*Fs)||(first >= 2.52*Fs && last <= 2.66*Fs)||(first >= 2.73*Fs && last <= 2.75*Fs))
            A_Min = MinValue(amdf,L_Min,L_Max);
            u(unvoice) = A_Min;
            unvoice = unvoice + 1;
        end
        if((first >= 0.53*Fs && last <= 1.14*Fs)||(first >= 1.21*Fs && last <= 1.35*Fs)|| (first >= 1.45*Fs && last <= 1.60*Fs)||(first >= 1.83*Fs && last <= 2.20*Fs)||(first >= 2.28*Fs && last <= 2.35*Fs)||(first >= 2.40*Fs && last <= 2.52*Fs)||(first >= 2.66*Fs && last <= 2.73*Fs))
            A_Min = MinValue(amdf,L_Min,L_Max);
            v(voice) = A_Min;
            voice = voice + 1;
        end
    end
end
end