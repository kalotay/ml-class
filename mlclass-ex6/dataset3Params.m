function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
persistent C;
persistent sigma;
persistent ran;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% Can you tell I don't like to use intermediate variables

if (isempty(ran))
    ran = true;
    C = 1;
    sigma = 0.3;
    ExponentRange = -2:0.5:1.5;
    HypothesisC = realpow(10, ExponentRange);
    HypothesisSigma = realpow(10, ExponentRange);
    PredictionError = Inf;

    for TestC = HypothesisC
        for TestSigma = HypothesisSigma
            TestError = mean(double(svmPredict(...
                svmTrain(X, y, TestC, ...
                @(x1, x2) gaussianKernel(x1, x2, TestSigma)), Xval) ~= yval));
            if TestError < PredictionError
                PredictionError = TestError;
                C = TestC;
                sigma = TestSigma;
            end
        end
    end
end


% =========================================================================

end
