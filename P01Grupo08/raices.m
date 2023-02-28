function x = raices(fun, a, b, dx)
% Función que obtiene las abscisas de los intervalos donde se encuentran 
% todas las raices de una función f(x) en un intervalo dado 
% (a, b) llamando a la función raizbus
% INPUTS:
%   -fun = función en forma anónima fun = @(x)
%   -(a, b) = intervalo de inicio de búsqueda
%   -dx = ancho del intervalo
% OUTPUTS:
%   -x = matriz de 2 columnas cuyas filas son las abscisas de los extremos 
% de los intervalos donde se encuentra la raíz
% Se asume: fun continua en (a, b); a < b; dx <= b-a
    x = [];
    % La forma de proceder será desplazar el extremo 'a' del intervalo 
    % hacia la derecha en pasos de longitud dx
    while a+dx < b
        % Al usar la función raizbus se encuentra el subintervalo que
        % contiene a la raíz
        [x1, x2] = raizbus(fun, a, a+dx, dx);
        % Se guardan los límites en la matriz x
        x(end+1, :) = [x1, x2];% No conocemos cuantas hay => redimensionar
        % 'a' avanza hacia b en pasos dx
        a = a+dx;        
    end
    % Si se sale del bucle es porque 'a+dx' adelanta o iguala a 'b' y se 
    % comprueba el último subintervalo (a, b)
    % (En vez de (a, a+dx) que se sale del inicial)
    [x1, x2] = raizbus(fun, a, b, dx);
    x(end+1, :) = [x1, x2];
end