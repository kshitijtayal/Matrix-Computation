function [tmp1 tmp2] = Given_trans(x1, x2, c, s)
    tmp1 = c * x1 - s * x2;
    tmp2 = s * x1 + c * x2;
end