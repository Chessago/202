v=5;l=2.3;u=2/180*pi;   %constant parameters of the dynamical model
t=0:0.01:2;     %give the initial value t(0)=0, and the step length 0.01 of t
x(1)=0;y(1)=0.3;theta(1)=5/180*pi;  %give the initial value
%dynamical model
for i=2:1:201 %the times of the loop is '200'
   dx=v*cos(theta(i-1));
   dy=v*sin(theta(i-1));
   dtheta=v/l*tan(u);
   %get x,y,theta at each moment
   x(i)=x(i-1)+dx;
   y(i)=y(i-1)+dy;
   theta(i)=theta(i-1)+dtheta;
end
figure 
plot(t,x)
xlabel('time/s');ylabel('x/m');title('x(t)');
figure 
plot(t,y)
xlabel('time/s');ylabel('y/m');title('y(t)');
figure 
plot(t,theta)
xlabel('time/s');ylabel('\theta/m');title('\theta(t)');
figure 
plot(x,y)
xlabel('x/m');ylabel('y/m');title('y(x)');