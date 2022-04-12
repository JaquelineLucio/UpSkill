using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Diagramas
{



    abstract class Person
    {
    }
    internal class Course
    {
    }
    internal class Classroom
    {
    }
    /*----------------------------------------*/

    internal class Object : Classroom
    {
    }

    /*--------------------------------------*/
    internal class Student : Person
    {
    }  
    internal class Employee : Person
    {
    }
    /*---------------------------------------*/
    internal class GraduateStudent : Student
    {
    }
    /*---------------------------------------*/
    internal class Manager : Employee
    {
    }
    internal class Instructor : Employee
    {
    }
    internal class Secretary : Employee
    {
    }
    internal class TeachingAssistant : Employee
    {
    }
    internal class Janitor : Employee
    {
    }
    /*--------------------------------------*/
    internal class DepartmentChair : Course
    {
    }
    internal class Lecture : DepartmentChair
    {
    }
    internal class Seminar : DepartmentChair
    {
    }
    internal class SeminarSpeaker : Seminar
    {
    }
    internal class ComputerLab : Classroom
    {
    }
}
