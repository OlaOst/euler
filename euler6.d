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
  int sumOfSquares = 0;
  int squareOfSum = pow(101 * 50, 2);
  
  for (int i = 1; i <= 100; i++)
    sumOfSquares += pow(i, 2);
  
  writeln(to!string(squareOfSum - sumOfSquares));
}