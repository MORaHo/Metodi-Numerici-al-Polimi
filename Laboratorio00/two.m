function b = two(a)
    if (a<0)
        b = a;
    elseif(a>=0)
        b = a;
        for ii = 1:5
            b = b + 1;
        end
        c=a;
        while ii<=5
            c=c+1; % c e` solo per esempio
            ii = ii + 1;
        end
    end

end 