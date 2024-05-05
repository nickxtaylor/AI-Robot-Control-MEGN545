function [n] = plooter(t, x, n)

%
figure(n)
hold on
grid on

title('MPC Simulation Results')
plot(t, x, 'LineWidth', 1.5)
ylabel('System Response')
xlabel('time')
legend('Desired Response', 'Actual Response')

hold off

%
% n = n+1;

end