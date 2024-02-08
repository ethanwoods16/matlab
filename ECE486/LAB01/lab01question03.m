x = 0:100;
y1 = rand(1, 101);
y2 = normrnd(0, 1, 1, 101);

%Homogenous




%%%%%%
% h1 %
%%%%%%
subplot(2, 1, 1);
stem(x, y1)

%%%%%%
% h2 %
%%%%%%
subplot(2, 1, 2);
stem(x, y2)