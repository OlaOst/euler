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
  
  for (int n = 1; n < 10001; n++)
    primes.popFront();
  
  writeln("prime nr " ~ to!string(10001) ~ " is " ~ to!string(primes.front));  
}