%% MEGN545 HW2

%
close all; clc;

%% 

%
N = length(clock);
ref_ex = zeros(size(angle));
idx = 857;

%
for i = 1:length(reference)-1

    ref_ex(i*idx:(i+1)*idx) = reference(i);

end

%
figure(1)
hold on

plot(tout, ref_ex)
plot(tout, angle)

hold off

%% 

%
mae = (1 / N) * (sum(abs(ref_ex - angle)))

%
mse = (1 / N) * (sum( (ref_ex - angle) .^ 2 ))

%
rmse = sqrt(mse)

%
re = ((abs(angle - ref_ex)) ./ ref_ex) .* 100;
control_accuracy = max(abs(100 - re))