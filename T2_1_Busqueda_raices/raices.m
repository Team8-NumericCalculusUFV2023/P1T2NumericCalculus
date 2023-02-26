function x = raices(fun, a, b, dx)

% Se asume: fun continua en (a, b); a < b; dx <= b-a
    x = [];
    while a+dx <= b
        [x1, x2] = raizbus(fun, a, a+dx, dx);
        x(end+1, :) = [x1, x2]; % No conocemos cuantas hay => redimensionar
        a = a+dx;
    end
    if a~=b
        [x1, x2] = raizbus(fun, a, a+dx, dx);
        x(end+1, :) = [x1, x2];
    end
end