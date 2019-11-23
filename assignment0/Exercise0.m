x1 = mysum(20)
x2 = mysum(100)

function Exercise1 = mysum(n)
    b = 0; %start from 0
    for i = 1:n  %adding the numbers up to n
        b = b + i; % adding number / number increment by 1
    end
    Exercise1 = b; %when it reaches to n, it returns the result value.
end
%This mysum function is adding the number from 0 to n value.
%For example, 1+2+3+4+5+6+......+n
