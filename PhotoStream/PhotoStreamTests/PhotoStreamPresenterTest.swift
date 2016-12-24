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
        
    }
    
    override func tearDown() {
        viewController = nil
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
        
        let mockedVC = MockedPhotoStreamViewController()
       
        let expectation = self.expectation(description: "Parse Photos")
        mockedVC.closure = { (photos) in
            XCTAssertTrue(photos.count == 1)
            expectation.fulfill()
        }
        
        self.viewController?.presenter?.photoStreamViewController = mockedVC
        self.viewController?.presenter?.retrievePhotos()
        self.waitForExpectations(timeout: 5, handler: nil)
    }
    
}
