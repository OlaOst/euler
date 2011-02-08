import std.stdio;
import std.date;

void main()
{
  auto monthdays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  
  int monthday = 0;
  int weekday = 1;
  auto sum = [0,0,0,0,0,0,0];
  
  for (int year = 1900; year <= 2000; year++)
  {
    for (int month=0; month<12; month++)
    {
      if (month==1 && (year%400 == 0 || (year%4 == 0 && year%100 != 0)))
      {
        writeln(year);
        weekday += 29;
      }
      else
        weekday += monthdays[month];
        
      //if (weekday % 7 == 0 && year > 1900)
        //sum++;
      if (year > 1900)
        sum[weekday % 7]++;
    }
  }
  
  //foreach (s; sum)
    writeln(sum);  
}