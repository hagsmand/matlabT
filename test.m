clear all; close all; clc;
[x,y] = textread('C:\Users\Ajwl\Desktop\train matlab\DataTrain.txt','%f %f ');

distance = x; 
speed = y;
lenY = length(y); 
xPoint = 1:lenY; 
yPoint = y';
counter_subplot1 = 1;

for n = 0:lenY-1
    xPoint(n + 1) = n / (lenY - 1);  %make x fit to y
end

k = [10,50,300,500,750,950];

for i = 1:length(k)
    for round = k(i) % loop from 0 to 100
        nPoints = 100;  
        burnsteinScale = linspace(0.0,1.0,nPoints);  % scale burnstein graph within x axis 

        xc = (xPoint(length(xPoint)) - xPoint(1)).*burnsteinScale + xPoint(1); % x point of burnstein 

        x1 = linspace(xPoint(1), xPoint(length(xPoint)), round+1); %variable to make linear fit into burnstein
        linear = linear_spline_2(xPoint,yPoint,x1); % Ensure correct no. of control pts

        for i = 1:nPoints
            bernstein = bernstein_basis(round,burnsteinScale(i)); 
            burnsteinScale(i) = linear * bernstein';
        end 

        %curve = [xc; burnsteinScale]; 
        Ay(round,:) = burnsteinScale; 
        
        figure(1);
            subplot(2,3,counter_subplot1); 
            plot(xPoint,yPoint, 'm','LineWidth',1.5);  
            hold on;
            plot(xc,burnsteinScale, '--b','LineWidth',1.5 ); %drawnow
            hold on;
            axis([0 1 0 100]);
            title(["speed curve = ",num2str(round)]);
            legend('curve train',['n = ',num2str(round)]);
        hold on;
    end
    counter_subplot1 = counter_subplot1 + 1;
end 

w = [100,200,300,400];
count_color = 1;
for i = 1:length(w)
    for round = w(i) % loop from 0 to 100
        nPoints = 100;  
        burnsteinScale = linspace(0.0,1.0,nPoints);  % scale burnstein graph within x axis 

        xc = (xPoint(length(xPoint)) - xPoint(1)).*burnsteinScale + xPoint(1); % x point of burnstein 

        x1 = linspace(xPoint(1), xPoint(length(xPoint)), round+1); %variable to make linear fit into burnstein
        linear = linear_spline_2(xPoint,yPoint,x1); % Ensure correct no. of control pts

        for i = 1:nPoints
            bernstein = bernstein_basis(round,burnsteinScale(i)); 
            burnsteinScale(i) = linear * bernstein';
        end 

        %curve = [xc; burnsteinScale]; 
        Ay(round,:) = burnsteinScale; 
        m = 1;
        figure(2);
            subplot(2,2,1); 
     
            if(count_color == 1)
                m = plot(xPoint,yPoint, 'm','LineWidth',1.5);  
                hold on;
            end
            
            k = plot(xc,burnsteinScale, '--b','LineWidth',1.5); %drawnow
            hold on;
               
            axis([0 1 0 100]);
            title(["speed curve = ",num2str(round)]);
            xlabel('distance');
            
        hold on;
    end
    counter_subplot1 = counter_subplot1 + 1;
    count_color = count_color + 1;
end 
legend('rawdata','n=100','n=200','n=300','n=400');


w = [300,500,900];

for i = 1:length(w)
    for round = w(i) % loop from 0 to 100
        nPoints = 100;  
        burnsteinScale = linspace(0.0,1.0,nPoints);  % scale burnstein graph within x axis 

        xc = (xPoint(length(xPoint)) - xPoint(1)).*burnsteinScale + xPoint(1); % x point of burnstein 

        x1 = linspace(xPoint(1), xPoint(length(xPoint)), round+1); %variable to make linear fit into burnstein
        linear = linear_spline_2(xPoint,yPoint,x1); % Ensure correct no. of control pts

        for i = 1:nPoints
            bernstein = bernstein_basis(round,burnsteinScale(i)); 
            burnsteinScale(i) = linear * bernstein';
        end 

        %curve = [xc; burnsteinScale]; 
        Ay(round,:) = burnsteinScale; 
        
        figure(2);
            subplot(2,2,2); 
            plot(xPoint,yPoint, 'm','LineWidth',1.5);  
            hold on;
            plot(xc,burnsteinScale, '--b','LineWidth',1.5 ); %drawnow
            hold on;
            axis([0 1 0 100]);
            title(["speed curve = ",num2str(round)]);
        hold on;
    end
    counter_subplot1 = counter_subplot1 + 1;
end 

w = [250,500,750];

for i = 1:length(w)
    for round = w(i) % loop from 0 to 100
        nPoints = 100;  
        burnsteinScale = linspace(0.0,1.0,nPoints);  % scale burnstein graph within x axis 

        xc = (xPoint(length(xPoint)) - xPoint(1)).*burnsteinScale + xPoint(1); % x point of burnstein 

        x1 = linspace(xPoint(1), xPoint(length(xPoint)), round+1); %variable to make linear fit into burnstein
        linear = linear_spline_2(xPoint,yPoint,x1); % Ensure correct no. of control pts

        for i = 1:nPoints
            bernstein = bernstein_basis(round,burnsteinScale(i)); 
            burnsteinScale(i) = linear * bernstein';
        end 

        %curve = [xc; burnsteinScale]; 
        Ay(round,:) = burnsteinScale; 
        
        figure(2);
            subplot(2,2,3); 
            plot(xPoint,yPoint, 'm','LineWidth',1.5);  
            hold on;
            plot(xc,burnsteinScale, '--b','LineWidth',1.5 ); %drawnow
            hold on;
            axis([0 1 0 100]);
            title(["speed curve = ",num2str(round)]);
        hold on;
    end
    counter_subplot1 = counter_subplot1 + 1;
end 

w = [100,600];

for i = 1:length(w)
    for round = w(i) % loop from 0 to 100
        nPoints = 100;  
        burnsteinScale = linspace(0.0,1.0,nPoints);  % scale burnstein graph within x axis 

        xc = (xPoint(length(xPoint)) - xPoint(1)).*burnsteinScale + xPoint(1); % x point of burnstein 

        x1 = linspace(xPoint(1), xPoint(length(xPoint)), round+1); %variable to make linear fit into burnstein
        linear = linear_spline_2(xPoint,yPoint,x1); % Ensure correct no. of control pts

        for i = 1:nPoints
            bernstein = bernstein_basis(round,burnsteinScale(i)); 
            burnsteinScale(i) = linear * bernstein';
        end 

        %curve = [xc; burnsteinScale]; 
        Ay(round,:) = burnsteinScale; 
        
        figure(2);
            subplot(2,2,4); 
            plot((xPoint * 2000) + 1500,yPoint, 'm','LineWidth',1.5);  
            hold on;
            plot((xc * 2000) + 1500,burnsteinScale, '--b','LineWidth',1.5 ); %drawnow
            hold on;
            axis([1500 3500 0 100]);
            title(["speed curve = ",num2str(round)]);
        hold on;
    end
    counter_subplot1 = counter_subplot1 + 1;
end 
