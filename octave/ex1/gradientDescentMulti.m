function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

theta_temp = theta;

summation = zeros(length(theta), 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %


    % disp(computeCost(X, y, theta));

    for i = 1:m,
        for j = 1:length(theta),
            summation(j) = summation(j) + alpha * (1 / m) * (sum(theta' .* X(i, :), 2) - y(i)) * X(i, j);
        end;
    end;

    for k = 1:length(theta),

        theta_temp(k) = theta_temp(k) - summation(k);

        theta(k) = theta_temp(k);
    end;
    
    summation = zeros(length(theta), 1);

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
