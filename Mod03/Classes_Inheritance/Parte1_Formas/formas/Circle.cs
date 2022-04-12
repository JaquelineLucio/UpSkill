using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace formas
{

    public class Point
    {
        private double x, y;


        /*----constructor -----*/
        public Point(double x, double y)
        {
            this.x = x;
            this.y = y;
        }
        //------------------
    }
    abstract class Shape
    {
        //--
        protected string description;
        public abstract double Perimeter();

        public abstract double Area();
        //--
       public Shape() { }
       public Shape(string d)
        {
            description = d;
        }
    }
    class Circle: Shape
    {
        public Point p;
        private double r;


        /*----constructor -----*/
        public Circle(Point p, double r)
        {
            this.p = p;
            this.r = r;
        }
        //------------------

        //------Novo metodo --- sobrepoe ao herdado
      // new  public double Perimeter()
       public override double Perimeter()
        {
            return 0;
        }
        //override tbm sobrepoe a herança --virtual
         public override double Area() 
        {
            return 0; 
        }
    }

    class Rectangle: Shape
    {
        public Point p1, p2, p3, p4;
        private double r;


        private bool IsRetangle()
        {
            return true; 
        }
        /*----constructor -----*/
        public Rectangle(Point p1, Point p2, Point p3, Point p4)
        {
            if (!IsRetangle())
            {
                throw new Exception("Bad retangle");
            }
            this.p1 = p1;
            this.p2 = p2;
            this.p3 = p3;
            this.p4 = p4;
        }
        //------------------
        public override double Perimeter()
        {
            return 0;
        }
        public override double Area()
        {
            return 0;
        }
    }

    class Triangle: Shape
    {
        public Point p1, p2, p3;

        /*----constructor -----*/
        public Triangle(Point p1, Point p2, Point p3)
        {
            this.p1 = p1;
            this.p2 = p2;
            this.p3 = p3;
     
        }
        //------------------
        public override double Perimeter()
        {
            return 0;
        }
        public override double Area()
        {
            return 0;
        }
    }
}
