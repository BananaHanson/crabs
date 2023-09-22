# crabs
Introduction: Crabs is a kids computer game where a captain tries to catch a crab. 


Function: getCapt: number -> matrix
Purpose: This function generates a matrix representation of the Captain character at the origin with zero heading. <br>
Its input number is the size of the Captain characrter to be returned.Each column of the captain matrix is a point of the captain.<br>
The points are homogeneous caolumn vectors whose first element is x,  secodn y, and third is 1. The coordinate system <br>
is x increasing to the right and y increasing down. 
dependencies: none.
Call: capt = getCapt (50) will generate a matrix called caot of size 50.
side effects: none.
