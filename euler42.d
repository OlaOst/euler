import std.stdio;
import std.string;
import std.file;
import std.algorithm;


int wordvalue(string word)
{
  int sum = 0;
  
  foreach (letter; word)
    sum += letter-64;
  
  return sum;
}

void main()
{
  auto names = split(removechars(readText("words.txt"), "\""), ",");
    
  names[0] = "A";

  auto triangles = [0,1,3,6,10,15,21,28,36,45,55,66,78,91,105,120,136,153,171,190,210,231,253,276];

  int largest = 0;
  
  int sum = 0;
  
  foreach (name; names)
  {
  
    //auto arr = [ 1, 2, 3, 4, 1 ];
    //assert(find!("a > 2")(arr) == [ 3, 4, 1 ]);
    
    // with predicate alias
    //bool pred(int x) { return x + 1 > 1.5; }
    //assert(find!(pred)(arr) == arr);

    //bool pred(int x) { return x == wordvalue(name); }
    //auto thingy = find!("a == wordvalue(name)")(triangles);
    
    foreach (num; triangles)
    {
      if (num == wordvalue(name))
      {
        sum++;
        break;
      }
    }

    
    //if (wordvalue(name))
    //write(name ~ " value: ");
    //writeln(wordvalue(name));
    
    //if (largest < wordvalue(name))
      //largest = wordvalue(name);
  }
  
  writeln(sum);
}