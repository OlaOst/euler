import std.file;
import std.stdio;
import std.string;
import std.algorithm;


void main()
{
  auto names = split(readText("names.txt"), ",");

  long totalscore = 0;

  sort(names);

  foreach (int i, name; names)
  {
    //writeln(name);
    
    int score = 0;
    
    foreach (letter; name)    
      score += (letter-64);
      
    score *= (i+1);
    
    totalscore += score;
    
    write(name ~": ");
    writeln(score);
  }
  
  writeln(totalscore);
}
