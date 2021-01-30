using System;

namespace HW1
{
    class Program
    {
        static void Main(string[] args)
        {
            Tester test0 = new Tester();
            test0.testFilesWithStrings("/Users/c-villain/Downloads/A01_Счастливые_билеты-19350-02c525/0.String");

            Tester test1 = new Tester();
            test1.testFilesWithTickets("/Users/c-villain/Downloads/A01_Счастливые_билеты-19350-02c525/1.Tickets");

            Console.ReadKey();
        }
    }
}
