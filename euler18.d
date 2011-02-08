import std.math;
import std.stdio;


auto numbers = 
[[75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [95,64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [17,47,82, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [18,35,87,10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [20, 4,82,47,65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [19, 1,23,75, 3,34, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [88, 2,77,73, 7,63,67, 0, 0, 0, 0, 0, 0, 0, 0],
 [99,65, 4,28, 6,16,70,92, 0, 0, 0, 0, 0, 0, 0],
 [41,41,26,56,83,40,80,70,33, 0, 0, 0, 0, 0, 0],
 [41,48,72,33,47,32,37,16,94,29, 0, 0, 0, 0, 0],
 [53,71,44,65,25,43,91,52,97,51,14, 0, 0, 0, 0],
 [70,11,33,28,77,73,17,78,39,68,17,57, 0, 0, 0],
 [91,71,52,38,17,14,91,43,58,50,27,29,48, 0, 0],
 [63,66, 4,68,89,53,67,30,73,16,69,87,40,31, 0],
 [ 4,62,98,27,23, 9,70,98,73,93,38,53,60, 4,23]];

auto numbers2 = 
[[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];

void main()
{
  /*for (int depth = 0; depth < numbers.length-1; depth++)
  { 
    for (int col=0; col < numbers[0].length-1; col++)
    {
      auto left = numbers[depth+1][col] + numbers[depth][col];      
      
      numbers[depth+1][col] = left;
      
      auto right = numbers[depth+1][col+1] + numbers[depth][col];
      
      numbers[depth+1][col+1] = right;
    }
  }*/
  
  for (int col=0; col < numbers[0].length; col++)
    //writeln(numbers[numbers.length-1][col]);
    writeln(findmax(numbers.length-1, col));
}


int findmax(int depth, int col)
{
  int topleft = 0;
  int topright = 0;
  
  if (depth > 0)
  {
    if (col > 0)
      topleft = findmax(depth-1, col-1);
    
    if (col < numbers[depth-1].length)
      topright = findmax(depth-1, col);
  }  
  
  int left  = numbers[depth][col] + topleft;
  int right = numbers[depth][col] + topright;

  if (numbers2[depth][col] == 0)
  {
    numbers[depth][col] = cast(int)fmax(left, right);
    
    numbers2[depth][col] = 1;
  }
  
  return numbers[depth][col];
}
