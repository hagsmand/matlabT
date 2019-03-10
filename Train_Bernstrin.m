clear all; close all; clc;
[x,y]=textread('C:\Users\Ajwl\Desktop\train matlab\DataTrain.txt','%f %f ');
% A= [Traincurve];
distance=x; speed=y;
k=length(y);xp=1:k;yp=y';
% comxy=[ppx ppy]; mxy=max(comxy); yp=ppy/mxy; xp=ppx/mxy;
m=length(y);
for n=0:m-1
    xp(n+1)=n/(m-1);
end

for degree = 100; 

npts = 100; %number of point to plot
np = length(xp); 
xn = linspace(0.0,1.0,npts); % xn = normal coord's.
aa = xp(1); 
bb = xp(np);
xc = (bb - aa).*xn + aa; % xc = actual coord's
y = xn;
n = degree;
np1 = n+1;
x1 = linspace(xp(1), xp(np), np1);
y1 = linear_spline_2(xp,yp,x1); % Insure correct no. of control pts
for i = 1:npts;
xx = xn(i);
b1 = bernstein_basis(n,xx); 
y(i) = y1*b1';
end
curve = [xc; y]; 
Ay(n,:)=y;

BBK=figure(1); 
subplot(2,1,1)
plot(xp,yp, 'm','LineWidth',1.5 ); hold on;
plot(xc,y, '+b'); %drawnow
plot(Ay(100,:), y, '--r','LineWidth',1.5);

axis([0 1 0 100]); %scale graph [StartX StopX StartY StopY]

legend('Train Speed','BERNSTEIN')
 %title(['TRAIN SPEED BERNSTEIN PARAMETER']);
 title(['TRAIN SPEED BERNSTEIN PARAMETER n = ',num2str(degree)]);
 xlabel('t'); ylabel('f(t)');
 grid on; grid minor;
 %saveas(BBK,['D:\KMITL\PHD\CTHs\IMG\Train-Bernstein-n-',num2str(degree),'.png']);
 %hold off;

end