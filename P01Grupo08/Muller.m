function r = Muller(fun, a, b, ermax)
% Método de Muller para encontrar raíces de una función
% INPUTS:
%   fun = función dada en forma anónima f=@(x) 
%   (a, b) = intervalo donde se encuentra la raíz
%   ermax = error máximo
% OUTPUT:
%   r = raíz de la función encontrada

% Parámetros iniciales:
%   - Puntos iniciales de la parábola:
x0 = a;
x1 = b;
x2 = (a+b)/2;
%   - Cálculo de los denominadores de las deltas
h1 = x1 - x0;
h2 = x2 - x1;
%   - Cálculo de las deltas
delta0 = (fun(x1) - fun(x0)) / h1;
delta1 = (fun(x2) - fun(x1)) / h2;
a = (delta1 - delta0) / (h2 + h1);

% Iteraciones del método de Muller con bucle infinito
while true
    b = delta1 + h2 * a;
    c = fun(x2);
    aux = sqrt(b^2 - 4 * a * c); %raíz cuadrada del denominador de x3
    if abs(b - aux) < abs(b + aux) %determinar la forma del denominador del error
       den_error = b + aux;
    else
       den_error = b - aux;
    end
    error = -2*c /den_error; %cálculo del error
    raiz = x2 + error; %candidato a raíz
    
    % Condición de parada del bucle infinito -> determinamos si el
    % candidato a raíz es válido según el error 
    if abs(error) < ermax 
        r = raiz;
        return
    end
    
    % Vamos limitando el intervalo, otorgamos a las variables sus nuevos
    % valores correspondientes
    x0 = x1;
    x1 = x2;
    x2 = raiz;
    h1 = x1 - x0;
    h2 = x2 - x1;
    delta0 = (fun(x1) - fun(x0)) / h1;
    delta1 = (fun(x2) - fun(x1)) / h2;
    a = (delta1 - delta0) / (h2 + h1);
end
end