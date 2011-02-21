import std.stdio;
import std.conv;

struct Primes
{
  enum bool empty = false; // infiniprimes!

  void popFront()
  {
    if (index+1 >= primes.length)
    {
      auto primeFinder = primes[$-1];
      
      for (bool foundPrime = false; !foundPrime; )
      {
        foundPrime = true;
        
        foreach (prime; primes)
        {
          if (primeFinder % prime == 0)
          {
            primeFinder += 2;
            foundPrime = false;
          }
        }
      }
      
      primes ~= primeFinder;
    }
    index++;
  }
  
  void reset()
  {
    index = 0;
    primes = [2,3];
  }
  
  long front()
  {
    return primes[index];
  }
    
  int index = 0;
  long[] primes = [2,3];
}
