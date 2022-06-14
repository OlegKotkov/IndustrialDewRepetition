
import UIKit

class ViewController: UIViewController {
var instArray = [MusicInstrument]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createMuzInstr(instName: .guitar)
        createMuzInstr(instName: .bass)
        runFactory()
    }

    func createMuzInstr(instName: Instruments ){
        let newInst = FactoryInstruments.defoultFactory.createInstrument(name: instName)
        instArray.append(newInst)
    }
    func runFactory(){
       for new in instArray{
            new.makeMusic()
        }
    }
    
}

