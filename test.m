data = load('ex1data1.txt');
X = data(:, 1);
y = data(:, 2);

% number of training examples
m = length(y); 

plot(X, y, 'rx', 'MarkerSize', 10);       % Plot the data
ylabel('Profit in $10,000s');             % Set the y-axis label
xlabel('Population of City in 10,000s');  % Set the x-axis label

x = [ones(m, 1), (X .- mean(X)) ./ std(X)];

% Add a column of ones to x
% X = [ones(m, 1), data(:, 1)]; 

% initialize fitting parameters
theta = zeros(2, 1);          

% Some gradient descent settings
iterations = 1500;
alpha = 0.01;
function J = computeCost(x, y, theta),
  
  m = length(y);  
  J = 0;
  predictions = x * theta;
  sqrErrors = (predictions - y) .^ 2;

  J = 1 / (2 * m) * sum(sqrErrors);

end
J = computeCost(x, y, theta);

function [theta, J_history] = gradientDescent(x, y, theta, alpha, iterations)
  m = length(y);
  J_history = zeros(iterations, 1);
    
    % for i = iterations
    % so it doesn't just run forever.
    % But instructions say it should be from 1:iterations 
    % even though that gives a massive result
    for i = 1:iterations
    
    % Okay. I have no idea what's happening. 
    % Every time I "get it right", I get the same answer.
    % Which, mind you, is not the same as the key.
    
    % Old code. It works but its answers are not in the answer key.
%    hypothesis = x * theta;
 %   stdError = hypothesis - y;
  %  theta = theta - alpha * (1/m) * (stdError' * x)';
   
%    temp1 = theta - alpha * (1/m) * ((x * theta) - y)'
 %   temp2 = theta - alpha * (1/m) * x * ((x * theta) - y)
  %  
   % theta(1) = temp1;
    %theta(2) = temp2;
    
    % theta = theta - (change in theta)
    h = x * theta; % hypothesis vector = 97x2 * 2*1 = 97*1
    errors = h - y; % errors vector = 97x1 - 97x1 = 97x1
    changeTheta = (alpha / m) * (x' * errors); %change in theta vector = scalar * (2x97 * 97x1)
    theta = theta - changeTheta;
    
    % Store J after each iteration
    J_history(i) = computeCost(x, y, theta);
        
  endfor
endfunction
J = gradientDescent(x, y, theta, alpha, iterations)