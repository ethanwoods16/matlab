b = [0.18, 0.1, 0.3, 0.1, 0.18];
a = [1, -1.15, 1.5, -0.7, 0.25];
n = 101;
x = ones(1, n);

%%%%%%%%
% impz %
%%%%%%%%
subplot(4, 1, 1);

h = impz(b, a, n);
plot(h)

%%%%%%%%%%
% filter %
%%%%%%%%%%
subplot(4, 1, 2);

y = filter(b, a, x);
plot(y)

%%%%%%%%
% conv %
%%%%%%%%
subplot(4, 1, 3);

y = conv(h, x);
plot(y)

%%%%%%%%%%
% filter %
%%%%%%%%%%
subplot(4, 1, 4);

y = filter(h, 1, x);
plot(y)