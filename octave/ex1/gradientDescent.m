function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

temp_0 = theta(1);
temp_1 = theta(2);

sum_0 = 0;
sum_1 = 0;

for iter = 1:num_iters,

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    % disp(computeCost(X, y, theta));

    for i = 1:m,
        sum_0 = sum_0 + alpha * (1 / m) * (sum(theta' .* X(i, :), 2) - y(i));
        sum_1 = sum_1 + alpha * (1 / m) * (sum(theta' .* X(i, :), 2) - y(i)) * X(i, 2);        
    end;

    temp_0 = temp_0 - sum_0;
    temp_1 = temp_1 - sum_1;  

    theta(1) = temp_0;
    theta(2) = temp_1;

    sum_0 = 0;
    sum_1 = 0;

    % ============================================================

    % Save the cost J in every iteration
    J_history(iter) = computeCost(X, y, theta);

end;

end;
