using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace formas
{
    internal class Program
    {
        static void testeFiguras()
        {
           // Circle c = new Circle(p,5);
            Triangle t = new Triangle(new Point(3, 4), new Point(5, 7), new Point(0, 14));
            Rectangle r = new Rectangle(new Point(3, 4), new Point(5, 7), new Point(0, 14), new Point (5,4)); ;
        }
        static void Main(string[] args)
        {
            testeFiguras();
        }
    }
}
