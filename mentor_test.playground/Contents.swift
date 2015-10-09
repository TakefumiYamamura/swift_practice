import UIKit
class Car {
    var name:String
    var color:String
    var weight:Int
    var state:String?
    
    init (name:String, color:String, weight:Int) {
        self.name = name
        self.color = color
        self.weight = weight
    }
    
    func run() {
        self.state = "runninng"
        println("\(self.name)が走ります")
    }
    
    func brake() {
        self.state = "broke"
        println("\(self.name)は止まります")
    }
    
    func showState() {
        if self.state != nil {
            if self.state! == "running" {
                println("\(self.name)は走っています")
            }
            if self.state! == "broke" {
                println("\(self.name)は止まっています")
            }
        }
    }
}

var car = Car(name:"ハチロク", color: "白黒", weight: 940)
println(car.name)
println(car.color)
println(car.weight)
car.showState()
car.run()
car.brake()
car.showState()


