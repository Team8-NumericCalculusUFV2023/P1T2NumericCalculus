function [r, i] = ridder(fun, x1, x2, tol)
% Función que busca la raíz de una función en un intervalo 
% por el método de Ridder.
% INPUTS:
%   -fun = función dada en forma anónima fun = @(x)
%   -x1, x2 = intervalo donde se encuentra la raíz
%   -tol = tolerancia calculada como |xi − xi-1|
% OUTPUTS:
%   -i = número de iteraciones
%   -r = raíz encontrada

    f1 = fun(x1); 
    f2 = fun(x2);
    if f1 * f2 < 0      % BOLZANO (comprobamos que haya al menos una raiz)
        x3 = (x1+x2)/2; % Punto medio del intervalo
        f3 = fun(x3);   
        if f1 - f2 > 0  % Uso de j como exponente de -1 para definir 
                        % el signo de suma o resta en la fórmula x4
            j = 0;
        else
            j = 1;
        end
        x4 = x3 + (-1)^j * (x3 - x1) * f3 / (sqrt(f3^2 - f1*f2));
        i = 1; % iterador comienza en 1
        while abs(x4 - x3) > tol && fun(x4) ~= 0  
            % Se toma un nuevo intervalo, con x4 y xi más proximo a x4
            x = [x1, x2, x3];
            [~, ix] = min(abs(x4-x));
            x2 = x(ix);
            x1 = x4;
            x3 = (x1+x2)/2;

            if f1 - f2 > 0
                j = 0;
            else
                j = 1;
            end
            f1 = fun(x1); 
            f2 = fun(x2);
            f3 = fun(x3);
            x4 = x3 + (-1)^j * (x3 - x1) * f3 / (sqrt(f3^2 - f1*f2));
            i = i + 1;
        end
        r = x4;
    else
        disp("Este intervalo no contiene raices.")
    end
end