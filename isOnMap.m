%  Created Ken Owens 2023-08-18
%This funciton checks if a point is within the map boundary
%It returns a 1 if it is and 0 if in is not.

function inBounds = isOnMap(x,y,width,height,boarder)
% decide if the point (x,y) is on the map minus a boarder.

if( x > boarder && x < width-boarder &&  y > boarder && y < height-boarder)
      inBounds=1;
    else
      inBounds=0;
endif

endfunction
