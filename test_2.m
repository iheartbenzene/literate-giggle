function plotData(X, y)
  
figure; hold on;

data = load('ex2data1.txt');

X = data(:, [1, 2]); 
y = data(:, 3);

  
plss = find(y == 1);
mins = find(y == 0);

plot(X(plss, 1), X(plss, 2), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
plot(X(mins, 1), X(mins, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);

hold off;
end

function g = sigmoid(z)
  
  g = 1 / (1 + exp(-z));
  
end

function J = computeCost(X, y, theta)
  
  g = sigmoid(X * theta);
  theta_reg = [0; theta(2:end, :);];

  J = (1/m) * (-y' * log(g) - (1-y)' * log(1-g)) + (lambda/(2*m)) * theta_reg' * theta_reg;

  grad = (1/m) * (X' * (g-y) + lambda * theta_reg);
  
end