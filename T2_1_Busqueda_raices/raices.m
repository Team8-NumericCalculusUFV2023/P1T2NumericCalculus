function x = raices(fun, a, b, dx)
% Función que obtiene las abscisas de los intervalos donde se encuentran 
% todas las raíces de una función f(x) en un intervalo dado 
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
    % Se asegura que está dentro del intervalo
    while a+dx <= b
        % Al usar la función raizbus se encuentra el intervalo más próximo
        % a la raíz
        [x1, x2] = raizbus(fun, a, a+dx, dx);
        % Se guardan los límites en la matriz 
        x(end+1, :) = [x1, x2];% No conocemos cuantas hay => redimensionar
        % 'a' avanza hacia b
        a = a+dx;        
    end
    % En caso de sobrepasar 'a' a 'b' se comprueba el último 
    % intervalo (a,b) si hay una raíz
    if a~=b
        [x1, x2] = raizbus(fun, a, a+dx, dx);
        x(end+1, :) = [x1, x2];
    end
end
