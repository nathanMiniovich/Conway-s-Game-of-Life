# Conway-s-Game-of-Life
NOTE: Bug caught in game state file, file is unavailable during debug process. A board update method for Conway's Game of Life written in x86 assembly. For more info on Conway's Game of Life please go to: http://en.wikipedia.org/wiki/Conway%27s_Game_of_Life

Design and Implementation:
-The update method takes a game board as well as the width and height of the board as input

-The program initializes a one dimensional array. This one dimensional array is used to store the neighbor counts of every cell on the input board. It is allocated using calloc so that no work has to be done for tiles with zero living neighbors.

-The 2D array is traversed and every neighbor of every tile is checked (there are 8 neighbors). Whether or not a neighbor is or is not on the board is checked using arithmetic so as not to access anything out of bounds of the array. This is done by checking of the current tile is on the edge of the board, with the math changing slightly for each neighbor case.

-If a neighbor is alive the neighbor count is incremented, and after all 8 checks the neighbor count is stored in the 1D array.

-After the board is done being traversed the input board is updated using the 1D array. Every spot in the 1D array corresponds to a particular spot in the 2D array, and depending on the count of neighbors in the 1D array at that index the spot in the 2D array is killed, reborn or left alone.
Space and Time Analysis:

Runtime: 
Let us define the size of the input board as n. A 1D array is allocated to the size of n using calloc. In the initial traversal of the 2D array to count neighbors every element is only accessed once and assuming a worst case of every cell having at least one live neighbor every spot in the 1D array is accessed once. This leaves us with a worst case run time of n + n = 2n for the initial neighbor checks. When updating the input board every spot on the input board is accessed once, and regardless of whether or not a cell has to be updated the corresponding spot in the 1D array still has to be checked, leading to a worst case run time of n + n = 2n for the second portion. So the runtime is:
2n + 2n = 4n which simplifies to O(n) because constants are dropped.

Spacetime: 
The 1D array is only ever allocated to exactly the size of the 2D, meaning for an input size of n the 1D array will be allocated using calloc to size n. No other memory is dynamically allocated, which leads to a spacetime complexity of O(n)
