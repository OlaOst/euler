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
  for (int b = 1; b < 1000; b++)
  {
    for (int a = b; a < 1000; a++)
    {
      auto c = sqrt(pow(a, 2) + pow(b, 2));
      
      if (a+b+c == 1000)
        writeln(to!string(a*b*c));
    }
  }
}