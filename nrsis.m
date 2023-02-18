function r = nrsis(funs, x, ermax)
    % Se asume que la primera funcion contiene a todas las variables
    % simbolicas con las que se va a trabajar (usamos symvar sobre f1).
    % Se calculará el jacobiano solo en la primera iteración, se asume que 
    % podemos despreciar los cambios de las siguientes iteraciones por ser
    % el punto x cercano a la solución.
    xvars = symvar(funs(1));
    J = matlabFunction(jacobian(funs, xvars));
    b = matlabFunction(funs);
    % Trabajamos en columna
    x = num2cell(x'); % Convertimos a celda para pasar los argumentos x a J
    delta = linsolve(J(x{:}), -b(x{:}));
    x = cell2mat(x); % Convertimos de nuevo a vector columna para sumar
    r = x + delta;
    erit = norm(x-r);
    while erit > ermax
        x = num2cell(r);
        delta = linsolve(J(x{:}), -b(x{:}));
        x = cell2mat(x);
        r = x + delta;
        erit = norm(x-r);
    end
end