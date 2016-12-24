//
//  MockedPhotoStreamViewController.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/24/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import UIKit
import XCTest
@testable import PhotoStream

class MockedPhotoStreamViewController: PhotoStreamViewController {

    var closure: ((_ photos: [Photo]) -> Void)?
    
    override func updatePhotoDatasource(photos: [Photo]) {
        closure?(photos)
    }
}
