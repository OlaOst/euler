import std.algorithm;
import std.array;
import std.bigint;
import std.range;
import std.stdio;
import std.conv;
import std.string;
import std.math;

import Utils;


long collatz(long n)
{
  return (n % 2 == 0) ? n/2 : 3*n + 1;
}

void main(string args[])
{
  // start value to length
  long[long] len;
  
  len[1] = 1;
  
  foreach (n; iota(1, 1_000_000))
    findLen(n, len);
   
  long largest = -1;
  foreach (key, val; len)
  {
    if (key < 1_000_000 && largest < val)
    {
      largest = val;
      
      writeln("largest so far: " ~ to!string(key) ~ ":" ~ to!string(val));
    }
  }
}

void findLen(long n, ref long[long] len)
{
  if (collatz(n) !in len)
    findLen(collatz(n), len);
    
  len[n] = len[collatz(n)] + 1;
}
