import std.algorithm;
import std.array;
import std.range;
import std.stdio;
import std.conv;
import std.string;

import Utils;


void main(string args[])
{
  // find roots for [1..20]
  // while roots not empty
  // find least root in root array, remove from each if it exists
  // multiply least roots

  long[][int] roots;
  
  auto primes = Primes();
  
  for (int n = 1; n <= 20; n++)
  {
    auto num = n;
    
    foreach (prime; take(primes, n))
    {
      while (num % prime == 0)
      {
        roots[n] ~= prime;
        num /= prime;
      }
    }
  }
  
  int mul = 1;
  primes.reset();
  
  while (!roots.keys.empty)
  {
    //writeln("checking prime " ~ to!string(primes.front) ~ " against " ~ to!string(roots));
    
    bool foundPrime = false;
    foreach (key; roots.keys)
    {
      if (!roots[key].find(primes.front).empty)
      {
        foundPrime = true;
        break;
      }
    }
    
    if (foundPrime)
    {
      mul *= primes.front;
      
      foreach (key; roots.keys)
        if (roots[key][0] == primes.front)
          roots[key] = roots[key][1..$];
      
      foreach (key; roots.keys)
        if (roots[key].empty)
          roots.remove(key);
    }
    else
    {
      primes.popFront;
    }
  }
  
  writeln(to!string(mul));
}
