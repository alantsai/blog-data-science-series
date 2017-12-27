using System;
using System.Collections.Generic;

namespace DotNetMapReduceWordCount.Reducer
{
    class Program
    {
        static void Main(string[] args)
        {
            // 用來儲存已經出現過的字 - java版本會自動處理，不過這個stream需要手動記錄
            Dictionary<string, int> words = new Dictionary<string, int>();

            string line;

            while ((line = Console.ReadLine()) != null)
            {
                // 傳過來的key value用tab分割（Mapper也是用tab切割key和value）
                var keyValuePair = line.Split('\t');

                string word = keyValuePair[0];

                int count = Convert.ToInt32(keyValuePair[1]);

                // 如果已經有這個word，和字典的加總，不然就建立新的
                if (words.ContainsKey(word))
                {
                    words[word] += count;
                }
                else
                {
                    words.Add(word, count);
                }
            }

            // 把所有結果寫出來
            foreach (var word in words)
            {
                Console.WriteLine("{0}\t{1}", word.Key, word.Value);
            }
        }
    }
}
