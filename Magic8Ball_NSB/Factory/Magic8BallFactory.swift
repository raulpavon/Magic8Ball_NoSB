//
//  Magic8BallFactory.swift
//  Magic8Ball_NSB
//
//  Created by Raúl Pavón on 28/01/22.
//

import Foundation

protocol Magic8BallFactory {
    func makeMagic8BallViewController(magic8BallCoordinator: Magic8BallCoordinator) -> Magic8BallViewController
}

class Magic8BallFactoryImp: Magic8BallFactory {
    func makeMagic8BallViewController(magic8BallCoordinator: Magic8BallCoordinator) -> Magic8BallViewController {
        let magic8BallViewController = Magic8BallViewController(factory: self, magic8BallCoordinator: magic8BallCoordinator)
        return magic8BallViewController
    }
}
