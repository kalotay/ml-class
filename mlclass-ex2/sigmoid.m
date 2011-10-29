function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

one = ones(size(z));

g = one ./ (one + exp(-z));

end
