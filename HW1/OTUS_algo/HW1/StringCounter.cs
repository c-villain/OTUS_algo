using System;
namespace HW1
{
    public class StringCounter
    {
        public StringCounter() { }

        public int count(string inputString)
        {
            int count = 0;
            if (inputString == null) return 0;
            //count only 
            foreach (char c in inputString)
                if (c != '\0' && c != '\r' && c != '\n') count++;
            return count;
        }
    }
}
