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
    var navigationViewController: UINavigationController?
    
    static func spawnPhotoStream(parentViewController: UIViewController, networkManager: NetworkManager) -> PhotoStreamCoordinator {
        let coordinator = PhotoStreamCoordinator.init(parentViewController: parentViewController)
        
        let viewController = PhotoStreamPresenter.createViewController(networkManager: networkManager)
        viewController.delegate = coordinator
        let navigationViewController = UINavigationController.init(rootViewController: viewController)
        coordinator.navigationViewController = navigationViewController
        
        coordinator.parentViewController.addChildViewController(navigationViewController)
        coordinator.parentViewController.view.addAndAttachViewToMargins(view: navigationViewController.view)
        navigationViewController.didMove(toParentViewController: coordinator.parentViewController)
        return coordinator
    }
    
    init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
        super.init()
    }
}

extension PhotoStreamCoordinator: PhotoStreamViewControllerDelegate {
    
    func userSelectedPhoto(photo: Photo)  {
        let photoDetailsVC = PhotoDetailViewController(nibName: "PhotoDetailViewController", bundle: nil)
        photoDetailsVC.photo = photo
        navigationViewController?.pushViewController(photoDetailsVC, animated: true)
    }
}
