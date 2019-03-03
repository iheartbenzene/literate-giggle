% Most of this file is written and edited in the GitHub editor 
% and so may contain syntax errors.

data = load('ex1data1.txt');
x = data(:, 1);
y = data(:, 2);

% If instead x and y are stored as two separate sources of 1-d numerical data.
% x = load('xdat.txt') 
% y = load('ydat.txt') 

m = sum((x - mean(x)) .* y) / sum((x - mean(x)) .^ 2);
c = mean(y) - m * mean(x);

hold on;
plot(x, y, 'bo', 'MarkerSize', 10);
% this line is untested and so might not work properly. Feel free to edit accordingly.
plot(m .* x .+ c); 
% Also note, it doesn't actually start at the same y-intercept... 
% I'll fix that later but overall it's the best-fit line for the data.
ylabel('Label for y axis');
xlabel('Label for x axis');
hold off;
