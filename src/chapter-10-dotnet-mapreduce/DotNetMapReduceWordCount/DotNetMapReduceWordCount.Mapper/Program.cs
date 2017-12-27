using System;
using System.Text.RegularExpressions;

namespace DotNetMapReduceWordCount.Mapper
{
    class Program
    {
        static void Main(string[] args)
        {
            string line;

            while ((line = Console.ReadLine()) != null)
            {
                var words = Regex.Matches(line, @"[\w]+");

                foreach (var word in words)
                {
                    Console.WriteLine("{0}\t1", word);
                }
            }
        }
    }
}
