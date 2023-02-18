function [x1, x2] = raizbus(fun, a, b, dx)
    if fun(a) * fun(b) < 0
        [x1, x2] = deal(a, a+dx);
        while x2 <= b 
            if fun(x1) * fun(x2) < 0
                return
            else
                [x1, x2] = deal(x2, x2+dx);
            end
        end
        if x2 ~= b
            x2 = b;
        end
    else
         % disp("No se encuentra la raíz en el intervalo dado")
         [x1, x2] = deal(NaN);
    end
end