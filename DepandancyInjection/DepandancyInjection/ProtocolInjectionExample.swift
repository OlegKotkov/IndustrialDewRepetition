
import Foundation

protocol EngineCar {
    var hp: Int { get }
    var type : String { get }
}

class ElectricEngine: EngineCar {
     let hp: Int
     let type: String
    init (hp: Int, type: String){
        self.hp = hp
        self.type = type
    }
}
class GasolineEngine: EngineCar {
    let hp: Int
    let type: String
    init(hp: Int, type: String) {
        self.hp = hp
        self.type = type
    }
}
class DiselEngine: EngineCar {
    let hp: Int
    let type: String
    init(hp: Int, type: String) {
        self.hp = hp
        self.type = type
    }
}
class Automobile {
    let engine: EngineCar
    init(engine: EngineCar){
        self.engine = engine
    }
}
let electricEngine: EngineCar = ElectricEngine(hp: 100, type: "electric")
let gasolineEngine: EngineCar = GasolineEngine(hp: 150, type: "Benz")
let engines: [EngineCar] = [electricEngine, gasolineEngine]

let electricCar = Automobile(engine: electricEngine)
let benzCar = Automobile(engine: gasolineEngine)



//// Иньекция через свойство
class Truck {
  var engine: EngineCar = DiselEngine(hp: 500, type: "disel")
  var hasTrunk: Bool?
}
/*
let truck = Truck()
truck.engine = DiselEngine
truck.hasTrunk = false
*/

///Иньекция через метод

class Tractor {
    private var engine: EngineCar = DiselEngine(hp: 300, type: "disel")
    
    func changeEngine (_engine: EngineCar){
        self.engine = engine
    }
}
let tractor = Tractor()
tractor.changeEngine(_engine: gasolineEngine)
