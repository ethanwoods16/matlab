%% Noah Lambert ECE 486 Lab01 Q3

%% 2 X1
clear
n = 0:100;
a1 = 1;
a2 = sqrt(10);
x1 = rand(1,100);

[ustep,uimpulse] = unitGen(n,0);

%Convolute x[n] with a unit step
out = conv(x1, ustep);


%Create yc and yi like doing it out on paper
%yc
yc = (a1*out + a2*out) + (a1*out + a2*out);

%yi
yi = (a1*(out + out)) + (a2*(out + out));

%Remove decimal after MATLAB accuracy ends
%Could also do differences 
yi = round(yi, 19);
yc = round(yc, 19);

if isequal(yi, yc)
    disp('linear')
else 
    disp('not linear')
end
pause

%% 2 X2
clear
n = 0:100;
a1 = 1;
a2 = sqrt(10);

funcshift = 1;
x2 = randn(1, 101);
%n = 2 * ones(1, 6);
%x2 = 0:5;

%stem(x2, 'b');
%hold on

x2shift = zeros(1, (length(x2) - abs(funcshift)));

if funcshift < 0
    for i = 1:(length(x2) - abs(funcshift))
        x2shift(i) = x2(i+abs(funcshift));
    end
else
    for i = (1+abs(funcshift)):length(x2)
        x2shift(i) = x2(i-abs(funcshift));
    end
end

nx = n .* x2shift; %Multiplying by n

h2 = x2 + nx;

%stem(h2, 'r');

%Check for linearity
%yc
yc = (a1*x2 + a2*x2) + (a1*nx + a2*nx);
%yc = (a1*x2 + a1*x2)

%yi
yi = (a1*(x2 + nx)) + (a2*(x2 + nx));

yi = round(yi, 19);
yc = round(yc, 19);

if isequal(yi, yc)
    disp('linear')
else 
    disp('not linear')
end