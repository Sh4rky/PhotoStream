//
//  MockedPhotoStreamPresenter.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/24/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import XCTest
@testable import PhotoStream

class MockedPhotoStreamPresenter: PhotoStreamPresenter {
    
    var wasRetrievePhotoCalled: Bool = false
    
    override func retrievePhotos(_ search: String?) {
        self.wasRetrievePhotoCalled = true
    }
}
