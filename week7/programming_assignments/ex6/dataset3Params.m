function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

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

range = [0.01 0.03 0.1 0.3 1 3 10 30];
global_error = Inf;
c_hat = Inf;
sigma_hat = Inf;

chosen_c = Inf;
chosen_sigma = inf;

for i=1:8
    c_hat = range(i);
    
    for j=1:8
        sigma_hat = range(j);
        
        % training model
        model = svmTrain(X, y, c_hat, @(x1, x2) gaussianKernel(x1, x2, sigma_hat));

        % making predictions in CV set
        pred = svmPredict(model, Xval);
        
        % calculating pred. error
        current_error = mean(double(pred ~= yval));  % tip given by Andrew Ng
        
        if current_error < global_error
            global_error = current_error;
            chosen_c = c_hat;
            chosen_sigma = sigma_hat;
        end
    end
end

C = chosen_c;
sigma = chosen_sigma;


% =========================================================================

end
