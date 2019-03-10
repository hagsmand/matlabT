function b = bernstein_basis(n,xx)
%BERNSTEIN_BASIS returns values of Bernstein basis polynomials....
% ....Bn,i(xx),n >= 1 at xx
% b is a vector of length n+1, b(i+1)=Bn,i(xx), i=0,1,..,n;

if ((xx<0.0) | (xx>1.0));
error('xx out of range in function "bernstein_basis!"');
end
xx_1=1.0-xx;
b=1:n+1; % sets b(1)=1 and index to [1,n+1], not [0,n];
% other values of b overwritten below.
for i=1:n; %starting from B_1,1, building Bn,i from Bn-1,i;
b(i+1)=xx*b(i);
for j=i-1:-1:1;
b(j+1)=xx_1*b(j+1)+xx*b(j);
end;
b(1)=xx_1*b(1);
end;
end
