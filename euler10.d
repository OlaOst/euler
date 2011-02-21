import std.algorithm;
import std.array;
import std.range;
import std.stdio;
import std.conv;
import std.string;
import std.math;

import Utils;


void main(string args[])
{
  auto primes = Primes();
  
  long sum = 0;
  
  while (primes.front < 2_000_000)
  {
    sum += primes.front;
    
    primes.popFront();
  }
  
  writeln(to!string(sum));
}