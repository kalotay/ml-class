function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
grad = zeros(size(theta));
m = length(y);
h_theta = sigmoid(X * theta);
theta_var = theta(2:end);

J = (-y' * log(h_theta) - (1.0 - y)' * log(1.0 - h_theta) + ...
    lambda * theta_var' * theta_var / 2) / m;
grad(1) = X(:, 1)' * (h_theta - y) / m;
grad(2:end) = (X(:, 2:end)' * (h_theta - y) + lambda * theta_var) / m;

end
