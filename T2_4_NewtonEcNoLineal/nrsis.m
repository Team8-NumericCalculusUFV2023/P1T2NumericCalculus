function r = nrsis(funs, x, ermax)
    % Se asume que la primera funcion contiene a todas las variables
    % simbolicas con las que se va a trabajar (usamos symvar sobre f1).
    % Se calculará el jacobiano solo en la primera iteración, se asume que 
    % podemos despreciar los cambios de las siguientes iteraciones por ser
    % el punto x cercano a la solución.
    xvars = symvar(funs);
    J = matlabFunction(jacobian(funs, xvars), vars={xvars});
    b = matlabFunction(funs, vars={xvars});
    delta = linsolve(J(x), -b(x));
    r = x + delta';
    erit = norm(x-r); % Error de la iteración
    while erit > ermax
        x = r;
        delta = linsolve(J(r), -b(r));
        r = r + delta'; % linsolve nos devuelve array columna (delta)
        erit = norm(x-r);
    end
end