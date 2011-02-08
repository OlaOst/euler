import std.algorithm;
import std.range;
import std.stdio;
import std.conv;
import std.string;


void main(string args[])
{
  int[] palindromes;
  for (int n = 100; n <= 999; n++)
    for (int m = n; m <= 999; m++)
      if (isPalindrome(n*m))
        palindromes ~= n*m;
        
  sort(palindromes);
  
  writeln(to!string(palindromes[$-1]));
}


bool isPalindrome(int n)
{
  auto s = to!string(n);
  
  return s == s.dup.reverse;
}