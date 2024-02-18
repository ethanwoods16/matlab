% Constants for both tests
x = 0:100;
a1 = 1;
a2 = sqrt(10);

%%%%%%
% h1 %
%%%%%%
x1 = rand(1, 101);

%convolving x1 with unit step <-- This is by principle of doing so and
%doesn't actually change x1 whatsoever
x1 = conv(x1, heaviside(x));

% Building yc and yi using separate gain application methods
yc1 = (a1*x1+a2*x1)+(a1*x1+a2*x1);
yi1 = (a1*(x1+x1))+(a2*(x1+x1));

% Rounding off values to prevent false negatives due to rounding
% inconsistency
yc1 = round(yc1, 2);
yi1 = round(yi1, 2);

% Checking equivalence
if isequal(yc1, yi1)
    disp('linear')
else 
    disp('not linear')
end

%%%%%%
% h2 %
%%%%%%
x2 = normrnd(0, 1, 1, 101);

%% Building right-shifted vector for use in [n+1] part of function %%

% Concatenating x2 with a 1x1 vector containing 0, hence assuming that
% values <= 0 are 0 
shifted = [0, x2];

% Cutting off highest index to restore proper vector length
slice = shifted(1:101);
final = x.*slice;

% Building yc and yi using separate gain application methods
yc2 = (a1*x2+a2*x2)+(a1*final+a2*final);
yi2 = (a1*(x2+final))+(a2*(x2+final));

% Rounding off values to prevent false negatives due to rounding
% inconsistency
yc2 = round(yc2, 2);
yi2 = round(yi2, 2);

% Checking equivalence
if isequal(yc2, yi2)
    disp('linear')
else 
    disp('not linear')
end