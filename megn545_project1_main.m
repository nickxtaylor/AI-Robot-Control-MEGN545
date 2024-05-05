%% megn545

% rmse calculations
% rmse = sqrt( (sum(actual - predicted)^2)  / (N) )

%% 

%
rmse_ang = zeros(3, 1);
n = length(yangle);

%
for i = 1:3

    %
    % rmse(i) = sqrt( (sum(abs ( NNmodel_angle(:, i) - yangle(:, i) ) ) ^2) / (n));
    difference = NNmodel_angle(:, i) - yangle(:, i);
    square = difference .^ 2;
    mean_square = mean(square);
    rmse_ang(i) = sqrt(mean_square);

end

fang = mean(rmse_ang);

%%

%
rmse_pos = zeros(3, 1);
n = length(yposition);

%
for i = 1:3

    %
    % rmse(i) = sqrt( (sum(abs ( NNmodel_angle(:, i) - yangle(:, i) ) ) ^2) / (n));
    difference = NNmodel_pos(:, i) - yposition(:, i);
    square = difference .^ 2;
    mean_square = mean(square);
    rmse_pos(i) = sqrt(mean_square);

end

fpos = mean(rmse_pos);

%%

%%

%%

%%

