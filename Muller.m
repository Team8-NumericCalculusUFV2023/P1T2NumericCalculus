function [r] = Muller(fun, a, b, ermax)
%  El método Muller  es un algoritmo numérico que utiliza tres 
%  puntos en el intervalo para generar una parábola que aproxima 
%  la función, y luego utiliza la fórmula de la parábola para 
%  encontrar una nueva aproximación de la raíz.
% Valores de entrada:
% fun = sunción dada en forma anónima f = @(x)
% (a, b) = intervalo donde se encuentra la raíz
% ermax = error máximo
% Valores de salida:
% r: raices del polinomio

    % Cuerpo de la función:
    x0 = a;
    x1 = b;
    x2 = (a + b) / 2;
    
    er = 1;
    
    while er > ermax
        % Primero se calcula los coeficientes de la parabola:
        h0 = x1 - x0; 
        h1 = x2 - x1;
        d0 = (fun(x1) - fun(x0)) / h0;
        d1 = (fun(x2) - fun(x1)) / h1;
    
        a = (d1 - d0) / (h1 + h0);
        b =  a * h1 + d1;
        c = fun(x2);
    
        % Se calcula donde la parábola corta el eje x y guardamos la solución
        % más cercana a x2:
        if b > 0
            r = x2 - (2 * c) / (b + sqrt(b^2 - 4 * a * c));
        else
            r = x2 - (2 * c) / (b - sqrt(b^2 - 4 * a * c));
        end
    
        % Se calcula el error:
        er = abs((r - x2)/r);
    
        % Se reasignan los valores de x en función de si la solución es
        % compleja o real:
        if isreal(r)
            x = [x0 x1 x2]; 
            % Se guarda el valor más proximo a r quitando el más lejano
            [~,ps] = max(abs(r - x));
            x(ps) = [];
            x0 = x(1);
            x1 = x(2);
            x2 = r;
        else % Se emplea un método secuencial
            x0 = x1; 
            x1 = x2; 
            x2 = r;
        end
    end
end