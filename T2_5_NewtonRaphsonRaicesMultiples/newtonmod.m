function [xs, i] = newtonmod (f, xest, ermax)
% Se asume f función continua de una sola variable con derivadas continuas
    df1 = diff(f);
    df2 = diff(df1);

    f = matlabFunction(f);
    df1 = matlabFunction(df1);
    df2 = matlabFunction(df2);

    fxest = f(xest);
    df1xest = df1(xest);
    df2xest = df2(xest);
    
    xs = xest - fxest * df1xest / (df1xest^2 - fxest * df2xest);

    erit = abs((xs - xest) / xest);
    i = 1;
    while erit > ermax && f(xs) ~= 0
        xest = xs;

        fxest = f(xest);
        df1xest = df1(xest);
        df2xest = df2(xest);

        xs = xest - fxest * df1xest / (df1xest^2 - fxest * df2xest);

        erit = abs((xs - xest) / xest);
        i = i+1;
    end
end