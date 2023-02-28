function [xs, i] = newtonmod (f, xest, ermax)
% Función que permite calcular de manera aproximada una raíz de una función 
% dado un punto a próximo a ella.
% El algoritmo utilizado es el Método de Newton-Rapson, no obstante se ha
% modificado definiendo una nueva función (cociente de la función original 
% y su derivada) que tendrá las mismas raices que la función de entrada.
% INPUTS 
%   -f = funcion simbólica
%   -xest = punto próximo a la raíz
%   -ermax = error máximo
% OUTPUTS
%   -xs = raíz aproximada
%   -i = número de iteraciones
% El error se calculará como el valor absoluto de la diferencia relativa 
% entre iteraciones.
    % Calculamos la primera y segunda derivada de f
    df1 = diff(f);
    df2 = diff(df1);
    % Una vez calculadas las derivadas, trabajaremos con funciones anónimas
    f = matlabFunction(f);
    df1 = matlabFunction(df1);
    df2 = matlabFunction(df2);
    % Guardamos en variables las imágenes por legibilidad y evitar repetir
    % llamadas en la expresión de la nueva solución
    fxest = f(xest);
    df1xest = df1(xest);
    df2xest = df2(xest);
    % La nueva solución aproximada se calculará con la siguiente expresión
    xs = xest - fxest * df1xest / (df1xest^2 - fxest * df2xest);
    i = 1;
    % Mientras la diferencia relativa entre iteraciones sea menor que ermax
    % o la imagen de la función sea distinta de cero se repite el proceso
    while abs((xs - xest) / xest) > ermax && f(xs) ~= 0
        xest = xs;

        fxest = f(xest);
        df1xest = df1(xest);
        df2xest = df2(xest);

        xs = xest - fxest * df1xest / (df1xest^2 - fxest * df2xest);
        i = i+1;
    end
end
