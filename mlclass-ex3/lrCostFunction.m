function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
h_theta = sigmoid(X * theta);
reg = theta;
reg(1) = 0;

J = (-y' * log(h_theta) - (1.0 - y)' * log(1.0 - h_theta) + ...
    lambda * reg' * reg / 2) / m;
grad = (X' * (h_theta - y) + lambda * reg) / m;

% makes sure grad is a column vector
grad = grad(:);

end
