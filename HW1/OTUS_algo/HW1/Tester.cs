using System;
using System.IO;

namespace HW1
{
    public class Tester
    {
        public Tester()
        {
        }

        /// <summary>
        /// выводим в консоль ОК или не ОК для файла
        /// подразумеваем, что в файле с out вписано число (искл. для парса), а не что-то другое
        /// </summary>
        /// <param name="pathIn">путь к файлу .in, .out - вычисляем самостоятельно</param>


        void testCountString(string pathIn) {
            string input = File.ReadAllText(pathIn); //.in
            string outfileName = Path.GetFileNameWithoutExtension(pathIn) + ".out";
            string outFile = Path.GetDirectoryName(pathIn)+ "/" + outfileName;
            StringCounter counter = new StringCounter();
            int actual = counter.count(input);
            int expected = int.Parse(File.ReadAllText(outFile)); //.out
            if (expected == actual) Console.WriteLine("Test for file: {0} is OK", pathIn);
            else Console.WriteLine("Test for file: {0} has failed: expected {1} but actual {2}", pathIn, expected, actual);
        }

        public void testFilesWithStrings(string path) {
            string[] filePaths = Directory.GetFiles(path, "*.in");
            foreach (var filePath in filePaths)
            {
                this.testCountString(filePath);
            }
        }


        void testCountTicket(string pathIn)
        {
            int input = 2 * int.Parse(File.ReadAllText(pathIn)); //.in
            string outfileName = Path.GetFileNameWithoutExtension(pathIn) + ".out";
            string outFile = Path.GetDirectoryName(pathIn) + "/" + outfileName;
            TicketsCounter counter = new TicketsCounter();
            int actual = counter.count(input);
            int expected = int.Parse(File.ReadAllText(outFile)); //.out
            if (expected == actual) Console.WriteLine("Test for file: {0} is OK, value {1}", pathIn, expected);
            else Console.WriteLine("Test for file: {0} has failed: expected {1} but actual {2}", pathIn, expected, actual);
        }

        public void testFilesWithTickets(string path)
        {
            string[] filePaths = Directory.GetFiles(path, "*.in");
            foreach (var filePath in filePaths)
            {
                this.testCountTicket(filePath);
            }
        }
    }
}
