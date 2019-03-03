x = load('xdat.txt')
y = load('ydat.txt')

m = sum((x - mean(x)) .* y) / sum((x - mean(x)) .^ 2);
c = mean(y) - m * mean(x);