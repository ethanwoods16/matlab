n = 101;

%%%%%%
% h1 %
%%%%%%
subplot(2, 1, 1);

y = rand(1, n);

stem(1 * y)




%%%%%%
% h2 %
%%%%%%
subplot(2, 1, 2);

x = normrnd(0, 1, n);
y = x + 