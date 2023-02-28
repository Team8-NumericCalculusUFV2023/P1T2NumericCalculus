function r = nrsis(funs, x0, ermax)
% Función que permite calcular de manera aproximada la solución de un
% sistema de ecuaciones no lineales.
% El algoritmo utilizado es el Método de Newton-Raphson, no obstante se ha
% modificado para resolver un sistema de n ecuaciones no lineales.
% INTPUTS:
%   -funs = vector columna que contiene las funciones en forma simbólica
%   -x0 = vector fila de solución inicial
%   -ermax = error máximo
% OUTPUTS:
%   -r = vector fila de soluciones
% El error se calculará como el valor absoluto de la diferencia relativa 
% entre iteraciones.
% Se calculará la matriz jacobiana solo en la primera iteración, se asume 
% que podemos despreciar los cambios de las siguientes iteraciones por ser
% el punto x0 cercano a la solución.
    % Identificamos las variables simbólicas de las funciones entrada
    x = symvar(funs);
    % Calculamos la matriz jacobiana y la convertimos a anónima usando la
    % función matlabFunction(), pasamos adicionalmente el parámetro vars,
    % con las variables simbólicas obtenidas anteriormente, con el fin de
    % poder pasar vectores cuando evaluemos la matriz en cada punto
    J = matlabFunction(jacobian(funs, x), vars={x});
    % Realizamos la misma operación con los términos independientes
    b = matlabFunction(funs, vars={x});
    % Resolvemos el sistema de ecuaciones J x = b
    % Con J la matriz jacobiana en el punto x0 y b el vector columna de
    % funciones evaluadas en el punto x0
    delta = linsolve(J(x0), -b(x0));
    % La nueva solución se obtendrá como la solución inicial más el delta
    % calculado anteriormente
    r = x0 + delta'; % linsolve nos devuelve array columna (delta)
    % Se repetirá el proceso mientras que la norma de la diferencia entre
    % iteraciones sea menor que el error máximo permitido.
    while norm(x0-r) > ermax
        x0 = r;
        delta = linsolve(J(r), -b(r));
        r = r + delta';
    end
end