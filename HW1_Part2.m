%% MEGN 545 NICK TAYLOR

% housekeeping
% clear all; close all; clc;
clc; close all;

%%

%
Y = position.Data(:, :);
time = clock.Data(:, :);
U_unex = reference.Data(:, :);

% now extrapolate on reference U
n_step = length(U_unex) - 1;
U = zeros(size(Y));
U(end) = U_unex(end);
for i = 1:n_step

    %
    dt = (length(time) - 1) / n_step;
    init = 1 + (i-1)*dt;
    final = i*dt;
    U(init:final) = U_unex(i);

end

%
figure(1)
hold on
grid on

plot(time, U, 'LineWidth', 1.5)
plot(time, Y, 'LineWidth', 1.5)
title('System Response After Training, Validation and Testing')
xlabel('Time')
ylabel('Output')
legend('Reference', 'NNPC Output')

hold off

%
figure(2)
hold on
grid on

plot(time, U - Y, 'LineWidth', 2)
title('NNPC Output Error vs. Time')
xlabel('time')
ylabel('U - Y')

hold off

%
max_err = max(abs(U - Y));
N = length(time);
rms = sqrt( (( sum(U - Y) ) .^ 2) ./ (N) );

%%

%
time_tr = (0 : tr_dat.Ts : tr_dat.Ts * length(tr_dat.U) - tr_dat.Ts)';
err_tr = tr_dat.U - tr_dat.Y;
rms_tr = sqrt( (( sum(err_tr) ) .^ 2) ./ (length(time_tr)) );

%
figure(3)
hold on

plot(time_tr, tr_dat.U, 'LineWidth', 1.25)
plot(time_tr, tr_dat.Y, 'LineWidth', 1.25)
title('Training Data - Plant vs Model over time')
xlabel('Time')
ylabel('Output')
legend('Plant Output', 'Model Output')

hold off

%
figure(4)
hold on

plot(time_tr, err_tr, "LineWidth", 1.25)
title('Training Data - Plant vs Model over time')
xlabel('Time')
ylabel('Error')

hold off

%%

%%

%%

%%

%%