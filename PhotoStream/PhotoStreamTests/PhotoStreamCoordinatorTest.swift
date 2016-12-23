//
//  PhotoStreamCoordinatorTest.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/22/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import XCTest
@testable import PhotoStream

class PhotoStreamCoordinatorTest: XCTestCase {
    
    func testSpawnPhotoStreamViewController() {
        let parentViewController = UIViewController()
        let mockedNetworkManager = MockedNetworkManager()
        let coordinator: PhotoStreamCoordinator = PhotoStreamCoordinator.spawnPhotoStream(parentViewController: parentViewController,
                                                                                          networkManager: mockedNetworkManager)
        XCTAssertTrue(coordinator.parentViewController.childViewControllers.count > 0)
    }
    
}
