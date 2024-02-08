%%%%%%%%%%%%%%%
% Unit Sample %
%%%%%%%%%%%%%%%
subplot(5,4,[1,4]);

x = 0;
stem(x, 1)
xlim([-20 40])

%%%%%%%%%%%%%
% Unit Step %
%%%%%%%%%%%%%
subplot(5,4,[5,8]);

x = -20:0.5:40;
y = heaviside(x);
y(y == 0.5) = 1;
%fplot(heaviside(x), [-20 40])
stem(x, y)

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Real Exponential Signal %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,[9,12]);

x = -20:.5:40;
y = 0.8.^x;
stem(x,y)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complex Exponential Signal %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = -20:.5:40;
y = (0.9*exp(pi*1i/10)).^x;

% Real
subplot(5,4,13);
stem(x,real(y))

% Imaginary
subplot(5,4,14);
stem(x,imag(y))

% Magnitude
subplot(5,4,15);
stem(x,(abs(y)))

% Phase
subplot(5,4,16);
stem(x, angle(y))

%%%%%%%%%%%%%%%%%%%%%%%
% Sinusoidal Sequence %
%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,4,[17,20]);

x = -20:40;
y = 2*cos(2*pi*0.3*x+pi/3);
stem(x, y)
