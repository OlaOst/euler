import std.algorithm;
import std.range;
import std.stdio;
import std.conv;
import std.math;



void main(string args[])
{
  foreach(prime; take(Primes(), 1000))
  {
    if (600_851_475_143 % prime == 0)
      writeln(to!string(prime));
  }
}


struct Primes
{
  enum bool empty = false; // infiniprimes!
  
  void popFront()
  {
    for (bool foundPrime = false; !foundPrime; )
    {
      foundPrime = true;
      
      foreach (prime; primes)
      {
        if (front % prime == 0)
        {
          front++;
          foundPrime = false;
        }
      }
    }
    
    primes ~= front;
  }
  
  long front = 2;
  long[] primes;
}
