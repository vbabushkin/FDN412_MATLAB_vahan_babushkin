%set starting value 
x=-1.5;
%set max number of iterations 
nmax=25; 
%initialize error bound eps 
eps=1;
%initialize array of iterates
xvals=x; 

MARGIN=1e-7
%initialize the domain (drawing rectangle)
xMin=-5%0.95
xMax=5%1.35

%initialize n (counts iterations)
n=0;                                           
f=@(x)sin(x)+x*cos(x)
%f=@(x)(x-1)^2
%f=@(x)x^6-2
fplot(f,[xMin,xMax])
hold on
fplot(@(x)0*x,[xMin,xMax],'k-')                           
%plot x axis
plot(x,0,'ro')
plot(x,feval(f,x),'r.')
plot([x x], [0 feval(f,x)],'g-')

%set while-conditions 
while eps>=MARGIN&n<=nmax                        
    
    xNext=x-(sin(x)+x*cos(x))/(2*cos(x)-x*sin(x));
    
    %compute next iterate 
    xNext=x-feval(f,x)/eval(diff(sym(f)))
    
    %write next iterate in array 
    xvals=[xvals;xNext]; 
    
    %draw a tangent till the intersection with x axis
    plot([x xNext], [feval(f,x) 0],'k-')
    
    %mark this intersection point as a red circle
    plot(xNext,0,'ro')
    
    %pause for 1 second
    pause(1)
    
    %draw a vertical line from the intersection point to curve 
    plot([xNext xNext], [0 feval(f,xNext)],'g-')
    
    %mark it as a red point
    plot(xNext,feval(f,xNext),'r.')
    
    %compute error
    eps=abs(xNext-x);                              
    %update x and n 
    x=xNext;n=n+1; 
    
    %pause for 1 second
    pause(1)
end
text(xNext,feval(f,xNext)-0.5,num2str(xNext,'%.16f'),'Color','r');
%end of while-loop