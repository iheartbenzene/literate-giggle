clear ; close all; clc

fprintf('Plotting Data ...\n')
data = load('ex1data1.txt');
X = data(:, 1);
y = data(:, 2);
m = length(y); % number of training examples

% Plot Data
plot(X, y, 'rx', 'MarkerSize', 10);       % Plot the data
ylabel('Profit in $10,000s');             % Set the y-axis label
xlabel('Population of City in 10,000s');  % Set the x-axis label

fprintf('Program paused. Press enter to continue.\n');
pause;

X = [ones(m, 1), data(:, 1)]; % Add a column of ones to x
theta = zeros(2, 1);          % initialize fitting parameters

% Some gradient descent settings
iterations = 1500;
alpha = 0.01;

fprintf('\nTesting the cost function ...\n')
% compute and display initial cost

function J = computeCost(X, y, theta)

  J = 0;
  
  m = length(y);
  
  predictions = X * theta;
  sqrErrors = (predictions - y) .^ 2;

  J = 1 / (2 * m) * sum(sqrErrors);
end


J = computeCost(X, y, theta);
fprintf('With theta = [0 ; 0]\nCost computed = %f\n', J);

% further testing of the cost function
J = computeCost(X, y, [-1 ; 2]);
fprintf('\nWith theta = [-1 ; 2]\nCost computed = %f\n', J);
fprintf('Expected cost value (approx) 54.24\n');

fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('\nRunning Gradient Descent ...\n')

function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

  for iter = 1:num_iters
    
    x = X(:, 2);
    hypothesis = theta(1) + (x * theta(2));
    stdError = hypothesis - y;
    
    %store theta1 as a temp value
    temp_zero = theta(1) - alpha * (1/m) * sum(stdError); 
    temp_one = theta(2) - alpha * (1/m) * sum(stdError .* x);
    
    %the hard part of the simultaneous update
    theta = [temp_zero; temp_one];
    
    J_history(iter) = computeCost(X, y, theta);

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

  end

end

% run gradient descent
theta = gradientDescent(X, y, theta, alpha, iterations);

% print theta to screen
fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);

% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

% Predict values for population sizes of 35,000 and 70,000
predict1 = [1, 3.5] *theta;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
predict2 = [1, 7] * theta;
fprintf('For population = 70,000, we predict a profit of %f\n',...
    predict2*10000);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============= Part 4: Visualizing J(theta_0, theta_1) =============
fprintf('Visualizing J(theta_0, theta_1) ...\n')

% Grid over which we will calculate J
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);

% initialize J_vals to a matrix of 0's
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];
	  J_vals(i,j) = computeCost(X, y, t);
    end
end


% Because of the way meshgrids work in the surf command, we need to
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals';
% Surface plot
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

% Contour plot
figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
