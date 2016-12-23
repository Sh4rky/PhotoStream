//
//  PhotoStreamCoordinator.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/22/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import Foundation
import UIKit

class PhotoStreamCoordinator: NSObject {
    
    var parentViewController: UIViewController
    
    static func spawnPhotoStream(parentViewController: UIViewController, networkManager: NetworkManager) -> PhotoStreamCoordinator {
        let coordinator = PhotoStreamCoordinator.init(parentViewController: parentViewController)
        let viewController = PhotoStreamPresenter.createViewController(networkManager: networkManager)
        
        coordinator.parentViewController.addChildViewController(viewController)
        coordinator.parentViewController.view.addAndAttachViewToMargins(view: viewController.view)
        viewController.didMove(toParentViewController: coordinator.parentViewController)
        return coordinator
    }
    
    init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
        super.init()
    }
}
