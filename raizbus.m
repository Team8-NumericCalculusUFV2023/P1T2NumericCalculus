function [x1, x2] = raizbus(fun, a, b, dx)
% Función para obtener un intervalo de ancho dx que contenga una raíz 
% de la función f(x) partiendo de un intervalo (a,b) con a < b
% INPUTS:
%   -fun = función en forma anónima fun = @(x)
%   -(a, b) = intervalo de inicio de búsqueda
%   -dx = ancho del intervalo
% OUTPUTS:
%   -[x1, x2] = intervalo de ancho dx donde se encuentra una raíz de f(x)
% Se asume: fun continua en (a, b); a < b; dx <= b-a
% Se usa el teorema de Bolzano para saber si existe una raíz en el
% intervalo
    if fun(a) * fun(b) <= 0        
        % Se asignan los límites del nuevo intervalo dado que se sabe que
        % en el intervalo (a,b) existe una raíz, se aplica el teorema de
        % Bolzano a pequeños subintervalos consecutivos desde 'a' para
        % encontrar el intervalo más pequeño que contenga a la raíz.
        [x1, x2] = deal(a, a+dx);
        % Con esta condición se asegura que x2 permanece en el intervalo
        % original     
        while x2 <= b 
            % Si el subintervalo se encuentra la raíz se sale del bucle
            if fun(x1) * fun(x2) <= 0
                return
            else
             % Sino el intervalo avanza dx, para ello le
             % damos a x1 el valor del anterior x2 y a x2 le sumamos dx.
                [x1, x2] = deal(x2, x2+dx);
            end
        end
        % Si se ha encontrado la raíz en el subintervalo y x2 esta 
        % fuera del intervalo se le asigna b 
        if x2 ~= b
            x2 = b;
        end
    % Si no se encuentra ninguna raíz le damos el valor NaN a 
    % los límites del  intervalo
    else
         [x1, x2] = deal(NaN);
    end
end