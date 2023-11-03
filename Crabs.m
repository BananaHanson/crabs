function retval = Crabs (level)

% Crabs is a kids computer game where a fisherman, called the captain,
% hunts for a very clever and powerful crab.
% Draw the game map and initialize map dimensions.
[mapHeight , mapWidth] = drawMap( "BGImage.png" );
% Initialize captain location, heading and size
xCapt = 1700;
yCapt = 950;
thetaCapt = -pi/2;
sizeCapt = 50;
healthCapt=100;
crabsCaught=0;
% Draw the captain and initialize graphics handles
%*********************************************************
% Put your call to drawCapt() here ..... You must give drawCapt its
% input and output arguments.
%initialize crab locations, headings and sizes
numCrabs = level;
xCrab = rand(1,numCrabs)*mapWidth;
yCrab = 3*mapHeight/4 + rand(1,numCrabs)*mapHeight/4;
thetaCrab = ones(1,numCrabs)*(-pi/2);
crabsCaught = 0;
sizeCrab = 50;
isCrabCaught = zeros(1,numCrabs);
%initialize jelly location, heading and size
numJelly = level;
xJelly = rand(1,numJelly)*mapWidth;
yJelly = rand(1,numJelly)*mapHeight;
thetaJelly = ones(1,numJelly)*(-pi/2);
sizeJelly = 25;
jellySting=2;
%draw initial captain and crab and jelly
[captGraphics,xNet,yNet] = drawCapt(xCapt,yCapt,thetaCapt,sizeCapt);

  for k=1:numCrabs
    crabGraphics(:,k) = drawCrab(xCrab(k),yCrab(k),thetaCrab(k),sizeCrab);
   endfor

for j=1:numJelly
    jellyGraphics(:,j) = drawJelly(xJelly(j),yJelly(j),thetaJelly(j),sizeJelly);
   endfor



% print health status
    healthLoc = [100,100];
     crabsCaughtLoc = [100,175];
       healthStatus = text(healthLoc(1), healthLoc(2), strcat('Health = ', ...
    num2str(healthCapt)), 'FontSize', 12, 'Color', 'red');
        crabsCaughtStatus = text(crabsCaughtLoc(1), crabsCaughtLoc(2), ...
    strcat('Crabs Caught = ',num2str(crabsCaught)), 'FontSize', 12, 'Color', 'red');




%%%%% main loop %%%%%%%%%%
while(1)
    % Put your jellyfish stuff here ...
    % erase old jellyfish
        for j=1:numJelly
             for i=1:length(jellyGraphics(:,j))
             delete(jellyGraphics(i,j));
             endfor
        endfor

    % move jellyfish
     for j=1:numJelly
    [xJelly(j),yJelly(j),thetaJelly(j)] = moveJelly(level, xJelly(j), yJelly(j),thetaJelly(j), sizeJelly, mapHeight,mapWidth);
     endfor

   % draw jellyfish
       for j=1:numJelly
        jellyGraphics(:,j) = drawJelly(xJelly(j),yJelly(j),thetaJelly(j),sizeJelly);
       endfor



    %remove old and plot new health and points status to screen
     delete(healthStatus);
     delete(crabsCaughtStatus);

     healthStatus = text(healthLoc(1), healthLoc(2), strcat('Health = ',num2str(healthCapt)), 'FontSize', 12, 'Color', 'red');
    crabsCaughtStatus = text(crabsCaughtLoc(1), crabsCaughtLoc(2),strcat('Crabs Caught = ', num2str(crabsCaught)), 'FontSize', 12, 'Color', 'red');


    % read the keyboard
    cmd = kbhit(1);
    if (cmd == 'Q')
       break;
    endif

   if( cmd == "w" || cmd == "a" || cmd == "d" ) %Captain has moved. Respond.
      % erase old captain
      for i=1:length( captGraphics )
        set( captGraphics(i), 'Visible', 'off' );
      endfor

      % move capt
      [xCapt, yCapt, thetaCapt] = moveCapt(cmd, xCapt, yCapt, thetaCapt);

      % draw new capt
      [captGraphics,xNet,yNet] = drawCapt( xCapt, yCapt, thetaCapt, sizeCapt);

 endif


     for k=1:numCrabs
        if( !isCrabCaught(k) && getDist(xNet,yNet,xCrab(k),yCrab(k)) < 2*sizeCapt ) %crab is caught
         crabsCaught = crabsCaught + 1;
         isCrabCaught(k) = 1;

    %erase old crab
             for i=1:length(crabGraphics(:,k))
             delete(crabGraphics(i,k));
             endfor
        endif
     endfor


     for j=1:numJelly
       if ( getDist(xJelly(j),yJelly(j),xCapt,yCapt) < 3*sizeCapt )
          healthCapt = healthCapt - jellySting;
       endif
     endfor

  fflush(stdout);
  pause(.01)

endwhile

close all
clear

%*******************************************************

endfunction
