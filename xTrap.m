function [extrapolated_vector] = xTrap(ref, y)

% Define your initial vector with 2521 length
original_vector = ref; % Example: Generating a random vector

% Create a vector representing the indices of the original vector
original_indices = 1:length(ref);

% Define the desired length for the extrapolated vector
desired_length = length(y);

% Create a vector representing the indices of the extrapolated vector
extrapolated_indices = linspace(1, length(original_vector), desired_length);

% Perform linear extrapolation using interp1
extrapolated_vector = interp1(original_indices, original_vector, extrapolated_indices, 'linear', 'extrap');
extrapolated_vector = extrapolated_vector';

end