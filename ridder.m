function [r, i] = ridder(fun, x1, x2, tol)
% Función que busca la raíz de una función en un intervalo 
% por el método de Ridder.
% fun = función dada en forma anónima fun = @(x)
% x1, x2 = intervalo donde se encuentra la raíz
% tol = tolerancia calculada como |xi − xi-1|
% i = número de iteraciones
% r = raíz encontrada
% Q = constante que se determina requiriendo que los puntos 
% (x1, g1), (x2, g2) y (x3,g3) se encuentren en una línea recta
    x3 = (x1-x2)/2;
    ehq = @(x) (fun(x3) + sqrt(fun(x3)^2-fun(x1)*fun(x2))) / fun(x2);
    g  = @(x) fun(x) * ehq;
    i = 1;
    while abs(x2 - x1) > tol 
        i = i + 1;
        x3 = (x1-x2)/2;
        if fun(x1) - fun(x2) > 0
            j = 0;
        else
            j = 1;
        end
    
        x4 = x3 + (-1)^j*(x3-x1)*fun(x3)/sqrt(fun(x3)^2-fun(x1)*fun(x2));
    
        if g(x3) == (g(x1)+g(x2))/2
            d1 = abs(x4-x1);
            d2 = abs(x4-x2);
            d3 = abs(x4-x3);
            d = [d1, d2, d3];
            x1 = x4;
            if max(d) == d1
                x2 = x1;
            elseif max(d) == d3
                x2 = x3;
            end
        else
            break;
        end
    end
    r = x4;
end






