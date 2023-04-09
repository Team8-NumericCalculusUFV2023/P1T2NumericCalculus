function r = Muller(fun, a, b, ermax)
% Método de Muller para encontrar raíces de una función
% INPUTS:
%   fun = función dada en forma anónima f=@(x) 
%   (a, b) = intervalo donde se encuentra la raíz
%   ermax = error máximo
% OUTPUT:
%   r = raíz de la función encontrada
% El error se calcula como el valor absoluto de la diferencia relativa
% entre iteraciones.
    % Puntos iniciales de la parábola:
    x0 = a;
    x1 = (a + b) / 2;
    x2 = b;
    % Cálculo de los denominadores de las deltas
    h0 = x1 - x0;
    h1 = x2 - x1;
    % Cálculo de las deltas
    f0 = fun(x0); f1 = fun(x1); f2 = fun(x2);
    delta0 = (f1 - f0) / h0;
    delta1 = (f2 - f1) / h1;
    a = (delta1 - delta0) / (h1 + h0);
    b = a * h1 + delta1;
    c = f2;
    % x3 será una de las raices de la parábola
    % Se elige la raíz tomando el signo del denominador igual al de b 
    % con el fin de obtener el denominador más grande y que x3 este lo más 
    % cerca de x2
    x3 = x2 + -2*c/(b+(-1)^(sign(b)<0)*sqrt(b^2-4*a*c));
    % El proceso se repite hasta que el error sea menor que el permitido
    while abs((x3-x2)/x3) >= ermax && fun(x3) ~= 0
        % De los 3 valores x0, x1, x2 se debe descartar uno
        % Si x3 es real se elimina el de mayor distancia a x3
        if isreal(x3)
            dist = [abs(x3-x0), abs(x3-x1), abs(x3-x2)];
            [~, i] = max(dist);
            x = [x0, x1, x2];
            x(i) = [];
            x0 = x(1);
            x1 = x(2);
        else
            x0 = x1;
            x1 = x2;
        end
        x2 = x3;
            % Cálculo de los denominadores de las deltas
        h0 = x1 - x0;
        h1 = x2 - x1;
        % Cálculo de las deltas
        f0 = fun(x0); f1 = fun(x1); f2 = fun(x2);
        delta0 = (f1 - f0) / h0;
        delta1 = (f2 - f1) / h1;
        a = (delta1 - delta0) / (h1 + h0);
        b = a * h1 + delta1;
        c = f2;
        % x3 será una de las raices de la parábola
        % Se elige la raíz tomando el signo del denominador igual al de b 
        % con el fin de obtener el denominador más grande y que x3 este lo más 
        % cerca de x2
        x3 = x2 + -2*c/(b+(-1)^(sign(b)<0)*sqrt(b^2-4*a*c));
    end
    r = x3;
end