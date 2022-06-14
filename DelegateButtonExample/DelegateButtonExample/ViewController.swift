
import UIKit

class ViewController: UIViewController {
    
    private let redView: RedView = {
       let view = RedView()
        view.backgroundColor = .red
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(redView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        redView.frame = view.bounds
        redView.delegate = self
    }
}

extension ViewController: TapDelegate {
    func tap(){
        print("TAAAAAAAP")
    }
}
