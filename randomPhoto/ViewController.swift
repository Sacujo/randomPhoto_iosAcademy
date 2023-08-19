//
//  ViewController.swift
//  randomPhoto
//
//  Created by Igor Guryan on 19.08.2023.
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
        button.setTitle("Random photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .random()
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        getRandomPhoto()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 20,
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
        view.backgroundColor = .random()
    }

    
    

}

extension CGFloat {
    static func random() -> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor{
        return UIColor(
            red: .random(),
            green: .random(),
            blue: .random(),
            alpha: 1)
    }
}
