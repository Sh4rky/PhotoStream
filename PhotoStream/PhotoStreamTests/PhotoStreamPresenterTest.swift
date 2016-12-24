//
//  PhotoStreamPresenterTest.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/22/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import XCTest
@testable import PhotoStream

class PhotoStreamPresenterTest: XCTestCase {
    
    var viewController: PhotoStreamViewController?
    
    override func setUp() {
        super.setUp()
        let mockedNetworkManager = MockedNetworkManager()
        self.viewController = PhotoStreamPresenter.createViewController(networkManager:mockedNetworkManager)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreationViewController() {
        guard let viewController = self.viewController
            else {
                XCTAssertTrue(false)
                return
        }
        XCTAssertTrue(type(of: viewController) == PhotoStreamViewController.self)
    }
    
    func testLoadPhotoStream() {
        self.viewController?.presenter?.retrievePhotos()
        XCTAssertTrue(self.viewController?.datasource?.photos.count == 1)
    }
    
}
