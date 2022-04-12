using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Diagramas
{

/** 
* PickupTruck
* */
    abstract class Vehicle
    {
    }
    internal class car : Vehicle
    {
    }
    /*--------------------------------*/
    internal class Sedan : car
    {
    }
    internal class Coupe : car
    {
    }
    internal class SportUtilityVehicle : car
    {
    }
    /*----------------------------------*/
    internal class Bicycle : Vehicle
    {
    }
    internal class Motorcycle : Vehicle
    {
    }
    internal class Truck : Vehicle
    {
    }
    internal class Minivan : Vehicle
    {
    }
}
