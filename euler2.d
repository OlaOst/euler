import std.algorithm;
import std.range;
import std.stdio;
import std.conv;


void main(string args[])
{
  auto evenFibs = filter!"a%2==0"(take(Fibrange(), 33));
  auto sum = reduce!"a+b"(0L, evenFibs);
  
  writeln(to!string(sum));
}


struct Fibrange
{
  int current = 0;

  enum bool empty = false; // infinifibs!
  
  long front()
  {
    return getfib(current);
  }
  
  void popFront()
  {
    current++;
  }
  
private:
  static long[int] memo;

  long getfib(int n)
  {
    if (n !in memo)
    {
      if (n <= 1)
        memo[n] = 1;
      else
        memo[n] = getfib(n-1) + getfib(n-2);
    }
    
    return memo[n];
  }
}