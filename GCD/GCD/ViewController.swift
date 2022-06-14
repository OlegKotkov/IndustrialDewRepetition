
import UIKit
class ViewController: UIViewController {
    let dispacher = Dispach()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        dispacher.doWorkWithItems()
        dispacher.asyncCallAfterTimeInterval(timeInterval:  2)
    }
}
class Dispach {
    let mainQueue = DispatchQueue.main
    let globalQueue = DispatchQueue.global(qos: .background)
    //последовательная
    let serialQueue = DispatchQueue (label: "serial")
    //параллельная
    let concurentQueue = DispatchQueue (label: "concurent", attributes: .concurrent)
    
    //Варианты бызова
    
    // 1. Блоки(замыкания
    func doWorkWithBlock(){
        globalQueue.async {
            for _ in 0..<100 {
                print("global")
            }
        }
    }
    // 2. DispachWorkItem
    func doWorkWithItems(){
        //Для лучшего упорядочения можно использовать DispachGroup
    let group = DispatchGroup()
            group.enter()
        let item = DispatchWorkItem(qos: .userInteractive, flags: .enforceQoS) {
            for _ in 0..<100 {
                print("in item")
            }
                group.leave()
        }
        group.enter()
        let item2 = DispatchWorkItem(qos: .unspecified, flags: .enforceQoS) {
            for _ in 0..<100 {
                print("in item 2")
            }
            group.leave()
        }
        group.enter()
        let item3 = DispatchWorkItem(qos: .utility, flags: .enforceQoS) {
            for _ in 0..<100 {
                print("in item 3")
            }
            group.leave()
        }
        group.enter()
        let item4 = DispatchWorkItem(qos: .background, flags: .enforceQoS) {
            for _ in 0..<100 {
                print("in item 4")
            }
            group.leave()
        }
        globalQueue.async (execute: item4)
        globalQueue.async (execute: item3)
        globalQueue.async (execute: item2)
        globalQueue.async (execute: item)
        group.notify(queue: .main) {
        print("group are ready")
        }
        }
    func asyncCallAfterTimeInterval( timeInterval: TimeInterval) {
        concurentQueue.asyncAfter(deadline: .now() + timeInterval) {
            print("work will after \(timeInterval)")
        }
    }
    }
    

