
import Foundation
import UIKit

final class CaptureImageView: UIView {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 100, y: 300, width: 100, height: 100)
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = .systemCyan
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    override init(frame: CGRect) {
        super .init(frame: frame)
        addSubview(imageView)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
