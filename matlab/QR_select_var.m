load('AB_sym.mat');

param_num = [0.075 0.1875 0.3 0.3 0.15 0.15 0.10 0.10 0.05 9.8 1 0.5 10 0.003 0.004 0.004 0.2 0.2];

[A, B] = AB_solve(A_sym, B_sym, param_num);

x_init = [1; 0; 0; 0; 0; 0; 0; 0; 0; 0];
x_set = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];

C = eye(10);
D = zeros(10, 4);

Q = diag([2 2 1200 20 100 1 100 1 2000 1]);
R = diag([0.25 0.25 1.0 1.0]);

K = lqr(A, B, Q, R);
K_d = lqrd(A, B, Q, R, 0.001);

