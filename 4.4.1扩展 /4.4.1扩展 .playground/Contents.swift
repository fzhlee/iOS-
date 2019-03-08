//: Playground - noun: a place where people can play

import UIKit

protocol Walking
{
    func walk()
}

protocol Fighting : Walking
{
    var damage:Int{get set}
    func fight()
}

protocol Eating
{
    func eat()
}

class Animal: Fighting, Eating
{
    var damage = 10
    func walk()
    {
        print("I'm walking gracefully!")
    }
    func fight()
    {
        print("I'm fighting hard!")
    }
    func eat()
    {
        print("I'm eating happily!")
    }

}
var animal = Animal()
print(animal.damage)            //输出结果：10
animal.walk()                //输出结果：I'm walking gracefully!
animal.fight()                //输出结果：I'm fighting hard!
animal.eat()
