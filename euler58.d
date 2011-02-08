import std.stdio;


bool flags[8191];


void calcPrimes()
{
  int count = 0;
  flags[] = true;
  
  //flags[]
  
  for (int i = 0; i < flags.length; i++)
  {
    if (flags[i])
    {	
      int prime = i + i + 3;
      int k = i + prime;
      
      while (k < flags.length)
      {
        flags[k] = false;
        k += prime;
      }
      
      count += 1;
    }
  }
}


void main()
{
  /*iter count    from->to   diff  nums          diff   diff to->first num of next series
      0:       1  1  -> 2    1     ( 0, 0, 0, 1) 0      1
      1:       9  2  -> 10   8     ( 3, 5, 7, 9) 2      3
                                    10,12,14,16
      2:      16  10 -> 26   16    (13,17,21,25) 4      5
                                    18,20,22,24
      3:      25  26 -> 50   24    (31,37,43,49) 6      7
                                    26
                                    57
  */

  calcPrimes();

  int totalsum = 1;
  int from = 1;

  for (int i=0; i < flags.length; i++)
  {
    write(i); write(" isprime: "); writeln(flags[i]);
  }
 
  for (int iter=1; iter < 25; iter++)
  {
    from += (iter-1) * 2 * 4; 
    
    int corner1 = from + (iter*2);
    int corner2 = corner1 + iter*2;
    int corner3 = corner2 + iter*2;
    int corner4 = corner3 + iter*2;

    //write(flags[corner1]); write(" "); write(flags[corner2]); write(" "); write(flags[corner3]); write(" "); write(flags[corner4]); write(" "); 
    
    //write(corner1); write(" "); write(corner2); write(" "); write(corner3); write(" "); writeln(corner4);
    
    //totalsum += corner1 + corner2 + corner3 + corner4;
  }
  
  //write("total sum: ");
  //writeln(totalsum);
  
  //1..9    -> 2*4, sum (x+1)%2
  //10..25  -> 4*4, sum (x+1)%4
  //26..49  -> 6*4, sum (x+1)%6
}


/*
43 44 45 46 47 48 49 50
42 21 22 23 24 25 26
41 20  7  8  9 10 27 52
40 19  6  1  2 11 28
39 18  5  4  3 12 29 54
38 17 16 15 14 13 30
37 36 35 34 33 32 31 56
                     57 
*/