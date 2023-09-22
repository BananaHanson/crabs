# crabs
Introduction: Crabs is a kids computer game where a captain tries to catch a crab. 


Function: drawLine: coordinates, colour -> line <br>
Purpose: This function takes two points, pointA and pointB, and a color, then draws a line between those points of the specified colour. <br>


Function: getCapt: number -> matrix
Purpose: This function generates a matrix representation of the Captain character at the origin with zero heading. <br>
Its input number is the size of the Captain characrter to be returned.Each column of the captain matrix is a point of the captain.<br>
The points are homogeneous caolumn vectors whose first element is x,  secodn y, and third is 1. The coordinate system <br>
is x increasing to the right and y increasing down. <br>
dependencies: none. <br>
Call: capt = getCapt (50) will generate a matrix called caot of size 50.<br>
side effects: none. <br>

Function: drawCapt: xCapt, ycapt, thetaCapt, captSize <br>
Purpose: this function takes
