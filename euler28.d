import std.stdio;

void main()
{
  /*iter count    from->to   diff  nums          diff   diff to->first num of next series
      0:       1  1  -> 2    1     ( 0, 0, 0, 1) 0      1
      1:       9  2  -> 10   8     ( 3, 5, 7, 9) 2      3
      2:      16  10 -> 26   16    (13,17,21,25) 4      5
      3:      25  26 -> 50   24    (31,37,43,49) 6      7
  */

  int totalsum = 1;
  int from = 1;
 
  for (int iter=1; iter < 501; iter++)
  {
    from += (iter-1) * 2 * 4; 
    
    int corner1 = from + (iter*2);
    int corner2 = corner1 + iter*2;
    int corner3 = corner2 + iter*2;
    int corner4 = corner3 + iter*2;

    //write("corner1: "); writeln(corner1);
    //write("corner2: "); writeln(corner2);
    //write("corner3: "); writeln(corner3);
    //write("corner4: "); writeln(corner4);
    
    totalsum += corner1 + corner2 + corner3 + corner4;
  }
  
  write("total sum: ");
  writeln(totalsum);
  
  //1..9    -> 2*4, sum (x+1)%2
  //10..25  -> 4*4, sum (x+1)%4
  //26..49  -> 6*4, sum (x+1)%6
}


/*
43 44 45 46 47 48 49 50
42                26
41                27 52
40                28
39                29 54
38                30
37 36 35 34 33 32 31 56
                     57 
*/