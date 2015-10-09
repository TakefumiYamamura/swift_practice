//: Playground - noun: a place where people can play

import UIKit




class Human {
    var children:[Human] = []
    var name:String
    var age:Int
    var state:String?
    
    init(_ name: String, _ age: Int) {
        self.name = name
        self.age = age
        println("\(name) がやってきた")
    }
    
    func walk() {
        self.state = "walking"
        println("\(self.name)が歩きます")
    }
    func sit() {
        self.state = "sitting"
        println("\(self.name)がすわります")
    }
    
    func showState() {
        if self.state! == "walking" {
            println("\(self.name)が歩いてる")
        }
        if self.state! == "sitting" {
            println("\(self.name)がすわってます")
        }

    }
    func showChildren() {
        for h in self.children {
            println("\(h.name): \(h.age) ")
        }
    }
    
}


var human = Human("a",1)

human.walk()
human.showState()




class Baby: Human {
    var face:String?
    func cry() {
        println("\(self.name)が泣きます")
        self.face = "crying"
    }
    func showFace() {
        if face != nil {
            switch self.face! {
            case "crying" :
                println("えんえん")
            default:
                break
            }
        }
    }
    override func walk(){
        self.state = "sitting"
        println("dfadfas")
    }
}

var baby = Baby(name: "しずか", age: 1)

baby.cry()
println(baby.face)



