clc; clear all;
N = 38; 
K = 3;

FFTa = (findMeanFFTofNA(1))';
FFTe = (findMeanFFTofNA(2))';
FFTi = (findMeanFFTofNA(3))';
FFTo = (findMeanFFTofNA(4))'; 
FFTu = (findMeanFFTofNA(5))';
dcx = 0;
matrix = zeros(5,5);
listfile = [ "D:\XLTHS\TH2\23MTL\"
    "D:\XLTHS\TH2\24FTL\"
    "D:\XLTHS\TH2\25MLM\"
    "D:\XLTHS\TH2\27MCM\"
    "D:\XLTHS\TH2\28MVN\"
    "D:\XLTHS\TH2\29MHN\"
    "D:\XLTHS\TH2\30FTN\"
    "D:\XLTHS\TH2\32MTP\"
    "D:\XLTHS\TH2\33MHP\"
    "D:\XLTHS\TH2\34MQP\"
    "D:\XLTHS\TH2\35MMQ\"
    "D:\XLTHS\TH2\36MAQ\"
    "D:\XLTHS\TH2\37MDS\"
    "D:\XLTHS\TH2\38MDS\"
    "D:\XLTHS\TH2\39MTS\"
    "D:\XLTHS\TH2\40MHS\"
    "D:\XLTHS\TH2\41MVS\"
    "D:\XLTHS\TH2\42FQT\"
    "D:\XLTHS\TH2\43MNT\"
    "D:\XLTHS\TH2\44MTT\"
    "D:\XLTHS\TH2\45MDV\"];
for i = 1 : 5
        if(i==1)
            for person = 1 : length(listfile)
               filename = listfile(person) + 'a.wav';
               [tStart, tEnd] = detectedSilence(filename);
                %%%nhan dang bang MFCC
%                 centerVectors = FindMFCCs1P(filename, tStart, tEnd, N);
%   day               [vowel, filename] = FindVowel(MFCCa, MFCCe, MFCCi, MFCCo, MFCCu, centerVectors, filename, K)
                             %%nhan dang bang FFT                 
                  centerVectorsFFT = (FindFFTof1P(filename, tStart, tEnd))';
                 [vowelFFT, filename] = FindVowel(FFTa, FFTe, FFTi, FFTo, FFTu, centerVectorsFFT, filename,1)
                 if(strcmp(vowelFFT,'a')==1)
                    dcx = dcx + 1;
                 end
                matrix = ConfusionMatrix('a', vowelFFT, matrix);
            end
        end
        if(i==2)
            for person = 1 : 21
               filename = listfile(person) + 'e.wav';
               [tStart, tEnd] = detectedSilence(filename);
                %%%nhan dang bang MFCC
%                 centerVectors = FindMFCCs1P(filename, tStart, tEnd, N);
%                 
%                 [vowel, filename] = FindVowel(MFCCa, MFCCe, MFCCi, MFCCo, MFCCu, centerVectors, filename, K)
                 centerVectorsFFT = (FindFFTof1P(filename, tStart, tEnd))';
                 [vowelFFT, filename] = FindVowel(FFTa, FFTe, FFTi, FFTo, FFTu, centerVectorsFFT, filename,1)
                if(strcmp(vowelFFT,'e')==1)
                   dcx = dcx + 1;
                end
                matrix = ConfusionMatrix('e', vowelFFT, matrix);
            end
        end
        if(i==3)
            for person = 1 : length(listfile)
                filename = listfile(person) + 'i.wav';
               [tStart, tEnd] = detectedSilence(filename);
                %%%nhan dang bang MFCC
%                 centerVectors = FindMFCCs1P(filename, tStart, tEnd, N);
%                 [vowel, filename] = FindVowel(MFCCa, MFCCe, MFCCi, MFCCo, MFCCu, centerVectors, filename, K)
                centerVectorsFFT = (FindFFTof1P(filename, tStart, tEnd))';
                 [vowelFFT, filename] = FindVowel(FFTa, FFTe, FFTi, FFTo, FFTu, centerVectorsFFT, filename,1)
                if(strcmp(vowelFFT,'i')==1)
                   dcx = dcx + 1;
                end
                matrix = ConfusionMatrix('i', vowelFFT, matrix);
            end
        end
        if(i==4)
            for person = 1 : length(listfile)
                filename = listfile(person) + 'o.wav';
               [tStart, tEnd] = detectedSilence(filename);
                %%%nhan dang bang MFCC
%                 centerVectors = FindMFCCs1P(filename, tStart, tEnd, N);
%                 [vowel, filename] = FindVowel(MFCCa, MFCCe, MFCCi, MFCCo, MFCCu, centerVectors, filename, K)
                
                centerVectorsFFT = (FindFFTof1P(filename, tStart, tEnd))';
                 [vowelFFT, filename] = FindVowel(FFTa, FFTe, FFTi, FFTo, FFTu, centerVectorsFFT, filename,1)
                if(strcmp(vowelFFT,'o')==1)
                   dcx = dcx + 1;
                end
                matrix = ConfusionMatrix('o', vowelFFT, matrix);
            end
        end
        if(i==5)            
            for person = 1 : 21
                filename = listfile(person) + 'u.wav';
               [tStart, tEnd] = detectedSilence(filename);
                %%%nhan dang bang MFCC
%                 centerVectors = FindMFCCs1P(filename, tStart, tEnd, N);
%                 [vowel, filename] = FindVowel(MFCCa, MFCCe, MFCCi, MFCCo, MFCCu, centerVectors, filename, K)
                
                centerVectorsFFT = (FindFFTof1P(filename, tStart, tEnd))';
                 [vowelFFT, filename] = FindVowel(FFTa, FFTe, FFTi, FFTo, FFTu, centerVectorsFFT, filename,1)
                if(strcmp(vowelFFT,'u')==1)
                   dcx = dcx + 1;
                end
                matrix = ConfusionMatrix('u', vowelFFT, matrix);
            end
        end
end
matrix
dcx = dcx*100/105;
WriteVector;     
            
