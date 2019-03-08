//: Playground - noun: a place where people can play

import UIKit

class Creature
{
    var name: String
    init (name: String)
    {
        self.name = name
    }
}

class Dog: Creature
{
    var master: String
    init (name: String, master: String)
    {
        self.master = master
        super.init(name: name)
    }
}
class Bird: Creature
{
    var food: String
    init (name: String, food: String)
    {
        self.food = food
        super.init(name: name)
    }
}
let creatures:[Creature] =
[
Dog(name: "Nono", master: "John"),
Bird(name: "Max", food: "Bugs"),
Dog(name: "Bailey", master: "Smith"),
Bird(name: "Charlie", food: "Spider"),
Dog(name: "Toby", master: "Bill")
]
var dogAmount = 0
var birdAmount = 0
for item in creatures
{
    if item is Dog
    {
        dogAmount += 1
    }
    else if item is Bird
    {
        birdAmount += 1
    }
}
print(dogAmount)        //输出结果：3
print(birdAmount)         //输出结果：2

for item in creatures
{
    if let dog = item as? Dog
    {
        print("Dog: \(dog.name), belongs to \(dog.master)")
    }
    else if let bird = item as? Bird
    {
        print("Bird: \(bird.name), loves \(bird.food)")
    }
}
