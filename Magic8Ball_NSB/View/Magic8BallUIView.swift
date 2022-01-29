//
//  Magic8BallUIView.swift
//  Magic8Ball_NSB
//
//  Created by Raúl Pavón on 28/01/22.
//

import UIKit

class Magic8BallUIView: UIView {
    
    enum Magic8BallUIViewConstraints {
        enum lbAsk {
            static let fontSize: CGFloat = 30
            static let top: CGFloat = 80
        }
        enum btAsk {
            static let fontSize: CGFloat = 30
            static let bottom: CGFloat = -85
            static let height: CGFloat = 50
            static let width: CGFloat = 100
        }
        enum imgBall {
            static let top: CGFloat = 50
            static let height: CGFloat = 240
            static let width: CGFloat = 240
        }
    }
    
    private lazy var mainContainer: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .systemTeal
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let lbAsk: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Magic8BallUIViewConstraints.lbAsk.fontSize)
        label.textColor = .white
        label.text = GlobalConstants.Ball8.title
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let imgBall: UIImageView = {
        let image = UIImageView(image: UIImage(named: GlobalConstants.Images.ball1))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var btAsk: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(GlobalConstants.Ball8.button, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPink
        button.titleLabel?.font = .systemFont(ofSize: Magic8BallUIViewConstraints.lbAsk.fontSize)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
    }
    
    private func addComponents() {
        addSubview(mainContainer)
        addSubview(lbAsk)
        addSubview(imgBall)
        addSubview(btAsk)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            lbAsk.centerXAnchor.constraint(equalTo: centerXAnchor),
            lbAsk.topAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.topAnchor, constant: Magic8BallUIViewConstraints.lbAsk.top),
            
            imgBall.topAnchor.constraint(equalTo: lbAsk.bottomAnchor, constant: Magic8BallUIViewConstraints.imgBall.top),
            imgBall.centerXAnchor.constraint(equalTo: centerXAnchor),
            imgBall.heightAnchor.constraint(equalToConstant: Magic8BallUIViewConstraints.imgBall.height),
            imgBall.widthAnchor.constraint(equalToConstant: Magic8BallUIViewConstraints.imgBall.width),
            
            btAsk.centerXAnchor.constraint(equalTo: centerXAnchor),
            btAsk.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor, constant: Magic8BallUIViewConstraints.btAsk.bottom),
            btAsk.heightAnchor.constraint(equalToConstant: Magic8BallUIViewConstraints.btAsk.height),
            btAsk.widthAnchor.constraint(equalToConstant: Magic8BallUIViewConstraints.btAsk.width),
        ])
    }
    
    func setBtAskTarget(target: Any?, action: Selector) {
        btAsk.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func didTapAsk() {
        let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]
        imgBall.image = #imageLiteral(resourceName: "ball3")
        //imageView.image = UIImage(named: "ball3")
        imgBall.image = ballArray.randomElement()
        //imageView.image = ballArray[Int.random(in: 0...ballArray.count - 1)]
    }
}
