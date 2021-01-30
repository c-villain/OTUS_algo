using System;
namespace HW1
{
    public class TicketsCounter
    {
        public TicketsCounter()
        { }
      
        int n;
        int q;

        public int count(int n)
        {
            this.n = n;
            this.q = 0;
            NextDigit(0, 0, 0);
            return q;
        }

        void NextDigit(int nr, int s1, int s2)
        {
            if (nr == n)
            {
                if (s1 == s2)
                    q++;
                return;
            }
            for (int a = 0; a <= 9; a++)
                if (nr < n / 2)
                    NextDigit(nr + 1, s1 + a, s2);
                else
                    NextDigit(nr + 1, s1, s2 + a);
        }
    }
}
