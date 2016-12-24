//
//  AppDelegate.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/22/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: PhotoStreamCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let viewController = UIViewController.init()
        viewController.view.frame = UIScreen.main.bounds
        window?.rootViewController = viewController

        let networkManager = NetworkManager()
        setupAppLookAndFeel()
        self.coordinator = PhotoStreamCoordinator.spawnPhotoStream(
            parentViewController: viewController,
            networkManager: networkManager)
        window?.makeKeyAndVisible()
        return true
    }

    func setupAppLookAndFeel() {
        UINavigationBar.appearance().backgroundColor = .black
        UINavigationBar.appearance().isOpaque = true
    }

}
