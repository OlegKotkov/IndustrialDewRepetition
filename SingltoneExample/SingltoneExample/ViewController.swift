import UIKit




class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Settings.shared.volume)
        Settings.shared.volume = 2.0
        print(Settings.shared.volume)
    }


}

