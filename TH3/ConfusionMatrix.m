
function  [matrix] = ConfusionMatrix(rightvowel, vowel, matrix)
    listvowel = ['a' 'e' 'i' 'o' 'u'];
    for i = 1: length(listvowel)
        if rightvowel == listvowel(i)
            for j =1:length(listvowel)
                if vowel == listvowel(j)
                    matrix(i,j) = matrix(i,j) +1;
                end
            end
        end
    end