import std.algorithm;
import std.range;
import std.stdio;
import std.conv;

void main(string[]args)
{
  int[] nums;
  nums.length = 1000;
  for (int c = 0; c < 1000; c++)
    nums[c] = c;
  
  auto divisibles = filter!("a % 3 == 0 || a % 5 == 0")(nums);
  
  auto sum = reduce!("a + b")(0, divisibles);
  
  writeln(to!string(sum));
}