syms x
% define our function as inline:
%f=@(x)(3*x^2 + 6*x -1)/(x^2 + x - 3)
f=((x-3)^2+5*(x^2-3))/(x^2-3)
num = (x-3)^2+5*(x^2-3)%3*x^2 + 6*x -1;

denom = x^2-3%x^2 + x - 3;

%initialize the domain (drawing rectangle)
xMin=-10
xMax=10

%plot function
ezplot(sym(f),[xMin xMax])
% Keep the graph of f in the figure
hold on

% To find the horizontal asymptote of the graph of f, take the limit of f 
% as x approaches positive infinity:
leftAsymptote=limit(sym(f), inf)
rightAsymptote=limit(sym(f), -inf)


%Plot left horizontal asymptote
plot([xMin xMax], [leftAsymptote leftAsymptote],'g--')

%Plot right horizontal asymptote
plot([xMin xMax], [rightAsymptote rightAsymptote],'g--')

% To find the vertical asymptotes of f, set the denominator equal to 0 and 
% solve by entering the following command:
roots = solve(denom);

for i=1:size(roots,1)
    %if the right and left limits are different
    if (limit(sym(f),x,roots(i),'left')~= limit(sym(f),x,roots(i),'right')) ||...
        (limit(sym(f),x,roots(i),'left')== Inf & limit(sym(f),x,roots(i),'right')== Inf) ||...   
        (limit(sym(f),x,roots(i),'left')== -Inf & limit(sym(f),x,roots(i),'right')== -Inf)
        % Plot vertical asymptotes
        plot(double(roots(i))*[1 1], [-1000 1000],'r--');
    end
end

%  first take the derivative of f:
f1 = diff(sym(f));

% To simplify this expression, enter
f1 = simplify(f1);

%set the derivative equal to 0 and solve for the critical points:
crit_pts = solve(f1);

%plot loc min and max
plot(double(crit_pts), double(subs(f,crit_pts)),'ro');


% Find Inflection Point
% To find the inflection point of f, set the second derivative equal to 0 
% and solve.

f2 = diff(f1);
inflec_pt = solve(f2);
double(inflec_pt);


inflec_pt = inflec_pt(1);

%add inflection point to the graph
plot(double(inflec_pt), double(subs(f,inflec_pt)),'go');

text(double(inflec_pt)-0.5,double(subs(f,inflec_pt))+0.5,'Inflection point','Color','g');
hold off



