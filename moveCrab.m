function [xCrab,yCrab,thetaCrab] = moveCrab(cmd,x,y,theta,height,width,size);
dTheta = pi/6;
dStep = 50;
if( cmd == "k" ) %move backward
xCrab = x-dStep * cos(theta);
yCrab = y-dStep * sin(theta);
thetaCrab = theta;
elseif ( cmd == "j" ) %move right
xCrab = x-dStep *  sin(theta);
yCrab = y+dStep * cos(theta);
thetaCrab = theta;
elseif ( cmd == "l" ) %move left
xCrab = x+dStep * sin(theta);
yCrab = y-dStep * cos(theta);
thetaCrab = theta;
elseif ( cmd == "i" ) %rotate right
xCrab = x;
yCrab = y;
thetaCrab = theta+dTheta;
elseif ( cmd == "," ) %rotate left
xCrab = x;
yCrab = y;
thetaCrab = theta-dTheta;
else % if none of the cases are true, set the new variables equal to the old inputs.
xCrab = x;
yCrab = y;
thetaCrab = theta;
endif

endfunction
