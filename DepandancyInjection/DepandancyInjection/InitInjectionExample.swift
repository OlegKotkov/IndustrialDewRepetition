import Foundation


class Engine {
    private let power: String
    
    init (power:String){
        self.power = power
    }
}
class Car {
    private let engine: Engine
    
    init (engine: Engine){
        self.engine = engine
    }
}
let engine1 = Engine(power: "150")
let car1 = Car(engine: engine1)

///
///
class Amp {
    private let power: Int
    init (power: Int){
        self.power = power
    }
}
class ActiveAcoustic{
    private let amp: Amp
    init(amp:Amp){
        self.amp = amp
    }
}
let ampJBL = Amp(power: 500)
let acousticPRX = ActiveAcoustic(amp: ampJBL)
///

class Alcogol{
    private let volume:Int
    
    init(volume:Int){
        self.volume = volume
    }
}
class AlcoDrink {
    private let beverage: Alcogol
    
    init (beverage: Alcogol){
        self.beverage = beverage
    }
}
let beverage1 = Alcogol(volume: 40)
let vodka = AlcoDrink(beverage: beverage1)

