function r = Muller(fun,a, b, ermax)
%   Muller: función que permite calcular las raíces de una función
%   mediante el método de Muller
%   Input: 
%       fun: función polinómica anónima sobre la que trabajamos 
%       (a,b): intervalo en el que buscamos la raíz 
%       ermax: error máximo permitido
%   Output: 
%       r: raíz obtenida

p0 = a;
p1 = b;
p2 = (b-a) / 2;
error = 1;

while error > ermax
    h0 = p1 - p0;
    h1 = p2 - p1;
    delta0 = (fun(p1) - fun(p0)) / h0;
    delta1 = (fun(p2) - fun(p1)) / h1;
    a = (delta1 - delta0) / (h1 + h0);
    b = a * h1 + delta1;
    c = fun(p2);
    c = c + a * h1^2 + b * h1;
    error = abs((p2 - p1) / p2);
    p0 = p1;
    p1 = p2;
    p2 = (-b + sqrt(b^2 - 4 * a * c)) / (2 * a);
end
r = p2;
end