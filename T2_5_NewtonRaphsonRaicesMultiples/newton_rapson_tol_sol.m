function [c, it] = newton_rapson_tol_sol(f, df, a, err)
% Funcion que permite calcular de manera aproximada una raiz de una funcion 
% dado un punto a proximo a ella.
% El algoritmo utilizado es el Metodo de Newton-Rapson.
% Inputs: 
% f = funcion anonima que devuelve un unico valor numerico [@()]
% df = funcion anonima que es derivada de f [@()]
% a = punto proximo a la raiz [num]
% err = error [float]
% Outputs:
% c = raiz aproximada
% El error se utilizara de forma que el algoritmo se detenga cuando la 
% imagen de la funcion sea menor que este.
    c = a - f(a)/df(a);
    fc = f(c);
    it = 1;
    err_it = abs((c - a) / a); % Error de la iteracion
    while(err_it > err && fc ~= 0)
        % El punto siguiente se calcula a partir del punto anterior
        a = c;
        c = c - fc/df(c);
        fc = f(c);
        it = it + 1;
        err_it = abs((c - a) / a);
    end