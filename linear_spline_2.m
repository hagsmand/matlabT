function f = linear_spline_2(x,y,xx)
% LINEAR_SPLINE_2 linear spline returns y(xx) by using a linear spline
% between points x where x, xx and y are vectors.
n=length(x);
nxx=length(xx);
%for any xx(j) out of range, stop the program
if (xx(1)<x(1)) | (xx(nxx)>x(n));
error('out of x range!');
end;
%loop for all the xx(j) points
for j = 1:nxx;
%for each xx(j), try to find which data interval it belongs
x1=xx(j);
for i = 1:n-1;
if (x1>=x(i)) & (x1<=x(i+1));
m=i;
break;
end;
end;
%calculate y(xx(j))
f(j) = y(m)*(x1-x(m+1))/(x(m)-x(m+1))...
+y(m+1)*(x1-x(m))/(x(m+1)-x(m));
end;
end