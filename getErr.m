function [err] = getErr(act, des, time)

%%  build final error plot

% 
activation_error = [3 .* (act(:, 1) - des(:, 1)), ...
                    -6 .* (act(:, 2) - des(:, 2)), ... 
                    -1000 .* (act(:, 3) - des(:, 3)), ...
                    -3 .* act(:, 4), ... 
                    -3 .* act(:, 5), ...
                    -3 .* act(:, 6)];

%
figure(2)
hold on
grid on

plot(time, activation_error(:, 1:3), 'LineWidth', 1.5)
title('Position Error from Activation Function over time')
xlabel('time')
ylabel('Activation Function Error')
legend('X', 'Y', 'Z')

hold off

%
figure(3)
hold on
grid on

plot(time, activation_error(:, 4:6), 'LineWidth', 1.5)
title('Angular Error from Activation Function over time')
xlabel('time')
ylabel('Activation Function Error')
legend('\phi', '\theta', '\psi')

hold off

%% build final reward plot

%
R_pos = [30 .* (act(:, 1) - des(:, 1)).^2, 30 .* (act(:, 2) - des(:, 2)).^2, -1000 .* (act(:, 3) - des(:, 3)).^2];
R_ang = [30 .* (act(:, 4)).^2, 30 .* (act(:, 5)).^2, 30 .* (act(:, 6)).^2];
R = [-R_pos, -R_ang];

%
figure(4)
hold on
grid on

plot(time, R(:, 1:3), 'LineWidth', 1.5)
title('Position Reward function vs. time')
xlabel('time')
ylabel('Reward')
legend('X', 'Y', 'Z')

hold off

%
figure(5)
hold on
grid on

plot(time, R(:, 4:6), 'LineWidth', 1.5)
title('Angular Reward function vs. time')
xlabel('time')
ylabel('Reward')
legend('\phi', '\theta', '\psi')

hold off

%% quantify RMSE

%
err = zeros(6, 1);
for i = 1:3

    diff = act(:, i) - des(:, i);
    diff_sq = diff .^ 2;
    numerator = sum(diff_sq);
    almost = numerator ./ length(act);
    final = sqrt(almost);
    err(i) = final;

end

%
for i = 4:6

    diff = act(:, i) - zeros(size(act(:, i)));
    diff_sq = diff .^ 2;
    numerator = sum(diff_sq);
    almost = numerator ./ length(act);
    final = sqrt(almost);
    err(i) = final;

end

%%

%
figure(6)
hold on
grid on

plot(time, act(:, 1), 'LineWidth', 1.5)
plot(time, des(:, 1), 'LineWidth', 1.5)
title('X Position Results')
xlabel('time')
ylabel('X Position')
legend('actual performance', 'desired trajectory')

hold off

%
figure(7)
hold on
grid on

plot(time, act(:, 2), 'LineWidth', 1.5)
plot(time, des(:, 2), 'LineWidth', 1.5)
title('Y Position Results')
xlabel('time')
ylabel('Y Position')
legend('actual performance', 'desired trajectory')

hold off

%
figure(8)
hold on
grid on

plot(time, act(:, 3), 'LineWidth', 1.5)
plot(time, des(:, 3), 'LineWidth', 1.5)
title('Z Position Results')
xlabel('time')
ylabel('Z Position')
legend('actual performance', 'desired trajectory')

hold off

end













