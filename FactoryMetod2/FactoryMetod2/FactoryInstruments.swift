
import Foundation

enum Instruments {
    case guitar
    case bass
}

class FactoryInstruments {
    static var defoultFactory = FactoryInstruments()
    func createInstrument (name: Instruments) -> MusicInstrument{
        switch name {
        case .guitar:
            return Guitar()
        case .bass:
            return Bass()
        }
    }
}
