# SSD: Scaling Subspace Decomposition

Find eigenvalue S, and corresponding eigenvector X, using Reighley quotient R(A,B)= x'Ax/x'Bx = X' S X / X'X 

Example:


A = (x1 - x2)' * ( x1 - x2); % L2 normal, x's dimension is nxp, n = number of observations, p = dimensionality. 

B = cov([x1; x2]); 

[S,X] = ReighleyQuotient(A,B,'min',1)
