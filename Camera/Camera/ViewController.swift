
import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    var session: AVCaptureSession!
    var frontCamera: AVCaptureDevice!
    var input: AVCaptureDeviceInput!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var output: AVCaptureVideoDataOutput!
    
    var takePhoto = false
    
    private lazy var captureImageButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.tintColor = .black
        button.layer.cornerRadius = 10
        button.frame = CGRect(x: 20, y: 20, width: 270, height: 55)
        return button
    }()
    @objc private lazy var captureImageView: CaptureImageView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(captureImageButton)
        view.addSubview(captureImageView)
        
        captureImageButton.addTarget(self, action: #selector(captureImage), for: .touchUpInside)
}
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkPermissions()
        startSession()
    }
    // Запрос на доступ к видео
    func checkPermissions() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized:
            print("authorized")
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { success in
                print("success")
            }
        default:
            break
        }
    }
    func startSession() {
        session = AVCaptureSession()
        session.beginConfiguration()
        session.sessionPreset = .photo
        configureInputs()
        configurePreview()
        configureOutputs()
        session.commitConfiguration()
        session.startRunning()
    }
    // Настраиваем вход - конкретное физическое устройство. В реальном приложении пишем без !!!! - проверяем на ошибки. Например устрйство может не иметь определенной камеры и тд
    func configureInputs() {
        frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)!
        input = try! AVCaptureDeviceInput(device: frontCamera)
        session.addInput(input)
    }
    //Конфигурирум слой. Это специальный класс, котрый можно добавить как слой
    func configurePreview() {
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        //  Добавляем превью как слой на вью
        view.layer.insertSublayer(previewLayer, at: 0)
        previewLayer.frame = view.layer.frame
    }
    func configureOutputs() {
        output = AVCaptureVideoDataOutput()
        let queue  = DispatchQueue(label: "video", qos: .userInitiated)
        output.setSampleBufferDelegate(self, queue: queue)
        session.addOutput(output)
        output.connections.first?.videoOrientation = .portrait
    }
    @objc func captureImage() {
        takePhoto = true
    }
}
// Делегат. Здесь мы передаем семлы(Этот класс ничего не знает о UIKit) ->  производим конвертацию в картинку вручную
extension ViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    
    func captureOutput(_ output: AVCaptureOutput, didDrop sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard takePhoto == true else {
            return
        }
        guard let buffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return
        }
        let ciImage = CIImage(cvImageBuffer: buffer)
        let image = UIImage(ciImage: ciImage)
        DispatchQueue.main.async {
            self.captureImageView.imageView.image = image
            self.takePhoto = false
        }
    }
}
