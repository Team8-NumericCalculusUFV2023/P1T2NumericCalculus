function [xs, i] = newton_rapson_tol_sol(f, xest, ermax)
% Función que permite calcular de manera aproximada una raíz de una función 
% dado un punto a próximo a ella.
% El algoritmo utilizado es el Método de Newton-Rapson.
% INPUTS:
%   -f = función simbólica
%   -xest = punto próximo a la raíz
%   -ermax = error máximo
% OUTPUTS:
%   -xs = raíz aproximada
%   -i = número de iteraciones
% El error se calculará como el valor absoluto de la diferencia relativa 
% entre iteraciones.
    % Se calcula la derivada con la función diff() y posteriormente se 
    % convierte a funciones anónimas usando la función matlabFunction().
    df = matlabFunction(diff(f));
    f = matlabFunction(f);
    % La nueva solución se define mediante la siguiente expresión
    xs = xest - f(xest)/df(xest);
    ys = f(xs);
    i = 1;
    % Mientras la diferencia relativa entre iteraciones sea menor que ermax
    % o la imagen de la función sea distinta de cero se repite el proceso
    while abs((xs - xest) / xest) > ermax && ys ~= 0
        % El punto siguiente se calcula a partir del punto anterior
        xest = xs;
        xs = xs - ys/df(xs);
        ys = f(xs);
        i = i + 1;
    end