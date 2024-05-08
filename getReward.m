function [] = getReward(R, time)

%
len = length(time);
r = zeros(size(R));

%
for i = 1:len

    r(i, :) = sum(R(1:i, :));

end

%
figure(10)
hold on
grid on

plot(time, r, 'LineWidth', 1.5)
title('Cumulative Reward Over Time')
xlabel('Time')
ylabel('Cumulative Reward')
legend('x', 'y', 'z', '\phi', '\theta', '\psi')

hold off

end