
import Foundation
class Guitar: MusicInstrument {
    var name: String = "guitar"
    
    var howManyStrings: Int = 6
    
    func makeMusic() {
        print("madeGuitar")
    }
}
