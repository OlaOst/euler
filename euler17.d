import std.algorithm;
import std.range;
import std.stdio;
import std.string;


auto txtnums = ["", "one","two","three","four","five","six","seven","eight","nine","ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"];
auto txtnum2 = ["", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"];


string numtext(int num)
{
  //if (num <= 0)
    //return "";
  if (num < 20)
    return txtnums[num];
  else if (num < 100)
    return txtnum2[num/10] ~ txtnums[num%10];
  else if (num < 1000)
  {
    if (num%100 == 0)
      return txtnums[num/100] ~ "hundred";
    //else if (num%10 == 0)
      //return txtnums[num/100] ~ "hundredand" ~ txtnum2[num%10+1];
    else
      return txtnums[num/100] ~ "hundredand" ~ numtext(num%100);
  }
  else
    return "onethousand";
}


void main()
{
  //foreach (txtnum; txtnums)
    //writeln(txtnum);

  //writeln(110%10);
    
  int len = 0;
    
  for (int i=1; i <= 1000; i++)
  {
    len += numtext(i).length;
    
    write(i);
    write(" -> " ~ numtext(i) ~ ", length: ");
    write(numtext(i).length);
    write(", acummulated: ");
    writeln(len);
  }

  //writeln(len);
}
