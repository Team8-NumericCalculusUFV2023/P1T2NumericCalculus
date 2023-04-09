function [xs, i] = biseccion(y, a, b, ermax)
% Función que permite calcular de manera aproximada una raíz de una función 
% dado un intervalo (a, b) que la contenga.
% El algoritmo utilizado es el Método de la bisección.
% INPUTS:
%   y = función en forma anónima
%   a = extremo menor del intervalo
%   b = extremo mayor del intervalo
%   ermax = error máximo admitido 
% OUTPUTS:
%   xs = raíz calculada
%   i = número de iteraciones
% El error se calculará como el valor absoluto de la imagen de la raíz 
% aproximada.
    % Comprobamos que el intervalo dado contiene una raíz
    if y(a)*y(b) <= 0
        % Inicialización de variables
        xs = (a+b) / 2;
        i = 1;
        ys = y(xs);
        while abs(ys) > ermax && ys ~= 0
            % Si el producto de imágenes da negativo intercambiaremos el
            % extremo del intervalo que corresponda con el punto medio
            % convergiendo a la raíz al reducir el rango de búsqueda
            if y(a) * ys < 0
                b = xs;
            else
                a = xs;
            end
            xs = (a+b) / 2;
            ys = y(xs);
            i = i + 1;
        end
    else
        disp("Este intervalo no contiene raices.")
    end
end