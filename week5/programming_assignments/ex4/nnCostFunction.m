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
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

%Step1 - feed forward
a1 = [ones(m,1) X];  % adding bias
a2 = sigmoid(Theta1*a1');

a2 = [ones(m,1) a2'];  % adding bias
a3 = sigmoid(Theta2*a2');

% recoding the labels as vectors containing only values 0 or 1 
y_recoded = zeros(num_labels, m);
for i=1:m
    y_recoded(y(i),i) = 1;
end

J = (-1/m) * sum ( sum ( (y_recoded) .* log(a3) + (1-y_recoded) .* log(1-a3) ));


%Step3 - regularization
Theta1_reg = Theta1(:,2:end);  % theta_0 should not be regularized
Theta2_reg = Theta2(:,2:end);

regularization = (lambda/(2*m)) * (sum(sum(Theta1_reg.^2)) + sum(sum(Theta2_reg.^2))); 

% Cost Function (Regularized)
J = J + regularization;


%Step2 - Backpropagation
for t=1:m
    
    %feed forward
    a1 = [ones(m,1) X];  % adding bias
    a1 = a1(t,:);
    a2 = sigmoid(Theta1*a1');

    a2 = [1 ; a2];  % adding bias
    a3 = sigmoid(Theta2*a2);

    % calculating deltas
    delta3 = a3 - y_recoded(:,t);
    delta2 = (Theta2'*delta3) .* sigmoidGradient([1;Theta1*a1']);
    delta2 = delta2(2:end);  % removing delta2(0)
    
    % gradients
    Theta2_grad = Theta2_grad + delta3 * a2';
    Theta1_grad = Theta1_grad + delta2 * a1;
end

Theta2_grad = (1/m) * Theta2_grad;
Theta1_grad = (1/m) * Theta1_grad;

% regularizing the gradients
Theta2_grad(:, 2:end) = Theta2_grad(:, 2:end) + ((lambda/m) * Theta2(:, 2:end)); % j >= 1 
Theta1_grad(:, 2:end) = Theta1_grad(:, 2:end) + ((lambda/m) * Theta1(:, 2:end)); % for j >= 1 

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
