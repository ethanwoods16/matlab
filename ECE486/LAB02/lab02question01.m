syms z1 z2 n;

x_n1 = ((0.8).^n)*heaviside(n-2);
X_z1 = ztrans(x_n1, n, z1);

disp('(a): Z-transform');
disp(X_z1);

x_n2 = ((0.5).^n+(-0.8).^n)*heaviside(n);
X_z2 = ztrans(x_n2, n, z2);

disp('(b): Z-transform');
disp(X_z2);