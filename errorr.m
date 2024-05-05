function [err] = errorr(u, y)

difference = u(:) - y(:);
square = difference .^ 2;
mean_square = mean(square);
rmse = sqrt(mean_square);
err = mean(rmse);

end