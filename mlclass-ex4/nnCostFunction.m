function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
Y = zeros(m, num_labels);
Y(sub2ind([m, num_labels], 1:m, y')) = 1;
a1 = [ones(m, 1), X];
z2 = a1 * Theta1';
a2 = [ones(m, 1), sigmoid(z2)];
z3 = a2 * Theta2';
a3 = sigmoid(z3);
%double sum for matrices
sum2 = @(x)(sum(sum(x)));
%cost function with forward prop
J = (sum2(-Y .* log(a3) - (1.0 - Y) .* log(1.0 - a3)) + ...
lambda * (sum2(Theta1(:, 2:end) .^ 2) + sum2(Theta2(:, 2:end) .^ 2)) / 2 ) / m;

%backprop
delta3 = a3 - Y;
delta2 = delta3 * Theta2(:, 2:end) .* sigmoidGradient(z2);
reg1 = Theta1;
reg1(:, 1) = 0;
reg2 = Theta2;
reg2(:, 1) = 0;
Theta1_grad = (delta2' * a1 + lambda * reg1) / m;
Theta2_grad = (delta3' * a2 + lambda * reg2) / m;

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];

end
