
import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
// create AudioPlaer
    private lazy var player = AVAudioPlayer()
    
    private let playButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("PLAY", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 7
        button.frame = CGRect(x: 20, y: 80, width: 270, height: 55)
        return button
    }()
    private let stopButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("STOP", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 7
        button.frame = CGRect(x: 20, y: 160, width: 270, height: 55)
        return button
    }()
    private let playVideoButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("Video", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 7
        button.frame = CGRect(x: 20, y: 240, width: 270, height: 55)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(playButton)
        view.addSubview(stopButton)
        view.addSubview(playVideoButton)
        playButton.addTarget(self, action: #selector(play), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(stop), for: .touchUpInside)
        playVideoButton.addTarget(self, action: #selector(playVideo), for: .touchUpInside)
        // Создаем ссылку на аудиофайл (точнее путь к файлу)
        let path = Bundle.main.path(forResource: "Marimba 2", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.volume = 0.5
            player.prepareToPlay()
        }
        catch {
            print(error)
        }
    }
      // Создаем ссылки на видео из интернета
//    private lazy var streamURL2 = URL(string:
//    "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master/////.m3u8")!
//
    var videos: [String] = [
        "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master/////.m3u8",
        "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master/////.m3u8"
        
    ]
    
    
    // Создаем ссылку локальную на видео
    private lazy var localURL: URL = {
        let path = Bundle.main.path(forResource: "sea", ofType: "mp4")!
        return URL(fileURLWithPath: path)
    }()
    @objc func playVideo() {
        let videoPlayer = AVPlayer(url: localURL)
        let vc = AVPlayerViewController()
        vc.player = videoPlayer
        present(vc, animated: true) {
            videoPlayer.play()
        }
    }
//Функционал аудио-кнопок
   @objc func play(){
       player.play()
    }
   @objc func stop(){
       if player .isPlaying {
           player.stop()
       } else {
           print("Not")
       }
    }
}

