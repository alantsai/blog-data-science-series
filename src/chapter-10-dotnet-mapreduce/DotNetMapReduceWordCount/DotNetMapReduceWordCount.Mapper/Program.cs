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
                // 用文字切割
                var words = Regex.Matches(line, @"[\w]+");

                foreach (var word in words)
                {
                    // 每一個找到的算1筆 - keyvalue用tab切割
                    Console.WriteLine("{0}\t1", word);
                }
            }
        }
    }
}
