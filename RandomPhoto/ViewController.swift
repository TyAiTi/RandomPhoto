import UIKit

import SDK

class ViewController: UIViewController {

    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("ModeScreen React", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let btnHalomeSDK: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("MoveScreen SDK", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemGreen,
        .systemYellow,
        .systemPurple,
        .systemOrange
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(button)
        view.addSubview(btnHalomeSDK)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        btnHalomeSDK.addTarget(self, action: #selector(moveHalomeSDK), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(topView),
                                               name: NSNotification.Name(rawValue: "goBackToPrevious"),
                                               object: nil)
    
    }

    
    
    @objc func moveHalomeSDK() {
        let callViewHalomeSDK = moveFlow()
        callViewHalomeSDK.startReact(RNScreen().Halome, withData: "654321")
    }
    
    
    
    
    @objc func didTapButton() {
        let callViewHalomeSDK = moveFlow()
//        callViewHalomeSDK.startReact("Halome", withData: "456789")
        
        callViewHalomeSDK.startReact("App", withData: "456789")
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30,
                              y: view.frame.size.height-150-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-60,
                              height: 40)
        btnHalomeSDK.frame = CGRect(x: 30,
                              y: view.frame.size.height-100-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-60,
                              height: 40)
    }

    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
    
    @objc func topView() {
           print("Thuc hien di chuyen man hinh")
        }
}

