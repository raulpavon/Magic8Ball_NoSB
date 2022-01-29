//
//  Magic8BallCoordinator.swift
//  Magic8Ball_NSB
//
//  Created by Raúl Pavón on 28/01/22.
//

import Foundation
import UIKit

class Magic8BallCoordinator {
    var navigationController: UINavigationController
    private let factory =  Magic8BallFactoryImp()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let magic8BallViewController = factory.makeMagic8BallViewController(magic8BallCoordinator: self)
        navigationController.setViewControllers([magic8BallViewController], animated: false)
    }
}
