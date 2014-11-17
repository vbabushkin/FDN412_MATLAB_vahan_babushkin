syms x
sigma=0.5
f=@(x)exp(1)^(-(x^2)./(2*(sigma)^2))

% ezplot does not work!!!
fplot(f,[-10 10])
hold on
%not necessary to find in this case
leftAsymptote=limit(sym(f), inf)
rightAsymptote=limit(sym(f), -inf)

%find min max
f1=diff(sym(f))

%set the derivative equal to 0 and solve for the critical points:
crit_pts = solve(f1);

%plot loc min and max
plot(double(crit_pts), double(subs(f,crit_pts)),'ro');

%inflection points
f2=diff(diff(sym(f)))
inflec_pt=solve(f2)
%plot inflection points
%plot(double(inflec_pt), double(subs(f,inflec_pt)),'go');
plot([-sigma, sigma], double(subs(f,inflec_pt)),'go');

%text(double(inflec_pt)-0.1,double(subs(f,inflec_pt))+0.1,'Inflection point','Color','g');
%add text to graph
text(sigma+0.3,double(subs(f,inflec_pt(2)))+0.02,...
    ['(',num2str(sigma),',',num2str(double(subs(f,inflec_pt(2)))),')'],'Color','g');
