a=2;%2
b=0.7;%0.5
T=200

theta=0:0.1:2*pi+1;
figure
axis equal
hold on

y=a*sin(theta);
x=a*cos(theta);
plot(x,y)

%set(gca,'NextPlot','replacechildren');
for k=1:1:T+5000

    theta=k*pi/(0.5*T)
    
    theta_cc=0:0.1:2*pi+1;
    x1=b*cos(theta_cc)+(a-b)*cos(theta);
    y1=b*sin(theta_cc)+(a-b)*sin(theta);
    p1=plot(((a-b)*cos(theta)), (a-b)*sin(theta),'k.');
    p2=plot(x1,y1,'r')
    
    
    y_cc=(a-b)*sin(theta)-b*sin((a-b)*theta/b);
    x_cc=(a-b)*cos(theta)+b*cos((a-b)*theta/b);
    
    plot(x_cc,y_cc,'g.','MarkerSize',5)
    p3=plot(x_cc,y_cc,'k.','MarkerSize',20)
    
    
    
    F(k) = getframe();
    set(p1,'Visible','off')
    set(p2,'Visible','off')
    set(p3,'Visible','off')
end
