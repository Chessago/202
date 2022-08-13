qustion2(1,0.0001,1)
pause(3)
function qustion2(kp,ki,kd)
v=5;l=2.3;m=1/180*pi;   %constant parameters of the dynamical model
t=0:0.025:50;     %give the initial value t(0)=0, and the step length 0.01 of t
x(1)=0;y(1)=0.3;theta(1)=5/180*pi;  %give the initial value
%the closed-loop
u(1)=0;e(1)=atan(m);u(2)=kp*(e(1)+ki*e(1));esum=e(1);
theta(2)=theta(1)+v/l*tan(u(1)+m);
for i=2:1:2000
    e(i)=atan(u(i)+m)-atan(u(i));
    esum=esum+u(i);
    u(i+1)=kp*(e(i)+ki*esum+kd*(e(i)-e(i-1)));
    dtheta=v/l*tan(u(i+1)+m);
    theta(i+1)=theta(i)+v/l*tan(u(i)+m);
end
for i=1:1:2000
    dx=v*cos(theta(i));
   dy=v*sin(theta(i));
   dtheta=v/l*tan(u);
   %get x,y,theta at each moment
   x(i+1)=x(i)+dx;
   y(i+1)=y(i)+dy;
end
plot(x,y)
xlabel('x/m');ylabel('y/m');title('y(x) with a PID controller,Kp=1,Ki=0.001,Kd=5');
hold on
figure
plot(t,u)
xlabel('t/s');ylabel('u/rad');title('u(t) with a PID controller,Kp=1,Ki=0.001,Kd=5');
hold on
end