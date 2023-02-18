function x = raices(fun, a, b, dx)
    if a+dx > b
        disp("Tamaño de incremento dx no válido (a+dx > b)")
        x = [NaN, NaN];
    else
        x = [];
        while a+dx <= b
            [x1, x2] = raizbus(fun, a, a+dx, dx);
            if ~anynan([x1, x2])
                x(end+1, :) = [x1, x2];
            end
            a = a+dx;
        end
        if a~=b
            [x1, x2] = raizbus(fun, a, b, dx);
            if ~anynan([x1, x2])
                x(end+1, :) = [x1, x2];
            end
        end
    end  
end