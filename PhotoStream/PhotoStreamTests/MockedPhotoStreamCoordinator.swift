//
//  MockedPhotoStreamCoordinator.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/24/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import UIKit
@testable import PhotoStream

class MockedPhotoStreamCoordinator: PhotoStreamCoordinator {
    
    var userSelectedPhotWasCalled: Bool = false
    
    override func userSelectedPhoto(photo: Photo)  {
        self.userSelectedPhotWasCalled = true
    }
}
