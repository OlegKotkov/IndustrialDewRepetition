//
//  RedView.swift
//  MVC&Delegate&Button
//
//  Created by mac on 30.05.2022.
//

import Foundation
import UIKit
class RedView: UIView {
    weak var delegate: TapDelegate?
    
    let blackButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Tap", for: .normal)
        button.layer.cornerRadius = 10
        button.frame = CGRect(x: 20, y: 100, width: 270, height: 55)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(blackButton)
        blackButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func tapButton() {
        delegate?.tap()
    }
    
}
