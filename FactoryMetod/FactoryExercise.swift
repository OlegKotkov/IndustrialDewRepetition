
import Foundation

enum Exercises {
    case jumping
    case squarts
    case swingPress
}
class FactoryExercises {
    // Singltone
    static let defaultFactory = FactoryExercises()
    // Создаем фабричный метод
    func createExercises (name: Exercises) -> Exercise {
        switch name {
        case .jumping:
            return Jumping()
        case .squarts:
            return Squarts()
        case.swingPress:
            return SwingPress()
        }
    }
}
