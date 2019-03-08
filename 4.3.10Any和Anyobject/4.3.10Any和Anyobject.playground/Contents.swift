//: Playground - noun: a place where people can play

import UIKit

var anythings = [Any]()
anythings.append(8)
anythings.append(3.1415)
anythings.append("hello")
anythings.append((3.0, 5.0))


for item in anythings
{
    switch item
    {
        case let someInt as Int:
            print("An integer value of \(someInt)")
        case let someSouble as Double:
            print("A double value of \(someSouble)")
        case let someString as String:
            print("An string value of \(someString)")
        case let (x, y) as (Double, Double):
            print("An (x,y) point of \(x), \(y)")
        default:
            print("Something else.")
        }
}
