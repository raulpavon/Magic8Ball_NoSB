//
//  Magic8BallViewController.swift
//  Magic8Ball_NSB
//
//  Created by Raúl Pavón on 28/01/22.
//

import UIKit

class Magic8BallViewController: UIViewController {
    
    weak var magic8BallCoordinator: Magic8BallCoordinator?
    private let factory: Magic8BallFactory
    
    private lazy var magic8BallUIView: Magic8BallUIView = {
        let view = Magic8BallUIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    required init(factory: Magic8BallFactory, magic8BallCoordinator: Magic8BallCoordinator) {
        self.factory = factory
        self.magic8BallCoordinator = magic8BallCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        initComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
        setTarget()
    }
    
    private func addComponents() {
        view.addSubview(magic8BallUIView)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            magic8BallUIView.topAnchor.constraint(equalTo: view.topAnchor),
            magic8BallUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            magic8BallUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            magic8BallUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setTarget() {
        magic8BallUIView.setBtAskTarget(target: self, action: #selector(didTapAsk))
    }
    
    @objc func didTapAsk() {
        magic8BallUIView.didTapAsk()
    }
}
