
import Foundation

protocol MusicInstrument {
    var name: String {get}
    var howManyStrings: Int {get}
    
    func makeMusic()
    
}
