function [vowel, filename] = FindVowel(vector_a, vector_e, vector_i, vector_o, vector_u, centerVectors, filename, K)
    vowel = '';
    a = [];
    e = [];
    i = [];
    o = [];
    u = [];
    D = [];
    for n = 1 : K
        a(n) = sqrt(sum((vector_a(n,:) - centerVectors) .^ 2));
        e(n) = sqrt(sum((vector_e(n,:) - centerVectors) .^ 2));
        i(n) = sqrt(sum((vector_i(n,:) - centerVectors) .^ 2));
        o(n) = sqrt(sum((vector_o(n,:) - centerVectors) .^ 2));
        u(n) = sqrt(sum((vector_u(n,:) - centerVectors) .^ 2));
    end
    D = [a e i o u];
    min = 999;
    for n = 1 : length(D)
        if min >= D(n)
            min = D(n);
        end
    end
    for n = 1 : K
        if (min - a(n)) == 0
            vowel = 'a';
        end
        if (min - e(n)) == 0
            vowel = 'e';
        end
        if (min - i(n)) == 0
            vowel = 'i';
        end
        if (min - o(n)) == 0
            vowel = 'o';
        end
        if (min - u(n)) == 0
            vowel = 'u';
        end
    end
end
