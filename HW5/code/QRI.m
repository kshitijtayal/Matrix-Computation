%% QRI Rayleigh Quotient Iteration to get the largest eigenvalue
%% Input matrix A; maximum iteration times t_max; eps0
%% Output eigenvector eigVec; eigenvalue eigVal; number of iteration iterNum; array of residuals for each iteration resArray

function [eigVec eigVal iterNum resArray] = QRI(A, iterMax, eps0)
	[n m] = size(A);
	eigVec = (rand(n, 1) - 0.5) * 2;
	[tmp1 tmp2] = max(abs(eigVec));
    eigVec = eigVec ./ eigVec(tmp2);
	eigVal = eigVec' * A * eigVec / (eigVec' * eigVec);
	B = (A - eigVal .* eye(size(A)))^(-1);
	iterNum = 1;
	resArray = zeros(iterMax, 1);
	resArray(iterNum) = norm(A * eigVec - eigVal * eigVec, 1);

    while (resArray(iterNum) > eps0 && iterNum < iterMax)
        eigVec = B * eigVec;
        [tmp1 tmp2] = max(abs(eigVec));
        eigVec = eigVec ./ eigVec(tmp2);
        eigVal = eigVec' * A * eigVec / (eigVec' * eigVec);
		B = (A - eigVal .* eye(size(A)))^(-1);
		iterNum = iterNum + 1;
		resArray(iterNum) = norm(A * eigVec - eigVal * eigVec, 1);
    end

end