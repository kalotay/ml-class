function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
J_history = zeros(num_iters, 1);
% (alpha * X' / length(y)) * (X * theta - y) is subtracted at every iteration
% taking the invariants out of the loop makes the function slightly faster
invariant = alpha * X' / length(y);
multiInvariant = invariant * X;
minusInvariant = invariant * y;

for iter = 1:num_iters
    theta = theta - multiInvariant * theta + minusInvariant;
    J_history(iter) = computeCost(X, y, theta);
end

end
