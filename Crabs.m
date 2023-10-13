
function retval = Crabs (input1, input2)

% Crabs is a kids computer game where a fisherman, called the captain,
% hunts for a very clever and powerful crab.
% Draw the game map and initialize map dimensions.
[mapHeight , mapWidth] = drawMap( "BGImage.png" );
% Initialize captain location, heading and size
xCapt = 1700;
yCapt = 950;
thetaCapt = -pi/2;
sizeCapt = 50;
% Draw the captain and initialize graphics handles
%*********************************************************
% Put your call to drawCapt() here ..... You must give drawCapt its
% input and output arguments.

captainGraphics = drawCapt (xCapt , yCapt , thetaCapt , sizeCapt);

cmd = "null"; % initial command

while ( cmd != "Q") % While not quit, read keyboard and respond

    cmd = kbhit(); % Read the keyboard.

    if( cmd == "w" || cmd == "a" || cmd == "d" ) %Captain has moved. Respond.
      % erase old captain
      for i=1:length( captainGraphics )
        set( captainGraphics(i), 'Visible', 'off' );
      endfor

      % move capt
      [xCapt, yCapt, thetaCapt] = moveCapt(cmd, xCapt, yCapt, thetaCapt);

      % draw new capt
      captainGraphics = drawCapt( xCapt, yCapt, thetaCapt, sizeCapt);

    endif
endwhile


%*******************************************************

endfunction
