//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Halome on 06/07/2022.
//

import UIKit

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
        button.setTitle("Random Photo", for: .normal)
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
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemYellow
//        view.addSubview(imageView)
//        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
//        imageView.center = view.center
//
//        view.addSubview(button)
//        getRandomPhoto()
//        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        //navigate
        title = "Push & Pop"
        let push = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        push.setTitle("Push Navigation", for: .normal)
        push.setTitleColor(.red, for: .normal)
        push.center = view.center
        push.addTarget(self, action: #selector(clickPush), for: .touchUpInside)
        view.addSubview(push)
    }
    @objc func clickPush(){
        print("Push")
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc func didTapButton() {
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30,
                              y: view.frame.size.height-150-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-60,
                              height: 55)
    }

    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
        
    }
}


class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        let pop = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        pop.setTitle("Push Navigation", for: .normal)
        pop.setTitleColor(.black, for: .normal)
        pop.center = view.center
        pop.addTarget(self, action: #selector(clickPop), for: .touchUpInside)
        view.addSubview(pop)
        
    }
    
    @objc func clickPop(){
        print("Pop")
//        let firstView = ViewController()
//        navigationController?.pushViewController(firstView , animated: true)
        navigationController?.popViewController(animated: true)
    }
}
