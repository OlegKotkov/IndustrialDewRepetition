
import Foundation
import UIKit

class RedView: UIView {
    
    weak var delegate:  TapDelegate?
  
    private let blueButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.setTitle("TAP", for: .normal)
        button.frame = CGRect(x: 20, y: 100, width: 275, height: 54)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(blueButton)
        blueButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func tapButton() {
        delegate?.tap()
    }
}
