//
//  PhotoStreamViewControllerTest.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/22/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import XCTest
@testable import PhotoStream

class PhotoStreamViewControllerTest: XCTestCase {
    
    var mockedCoordinator: MockedPhotoStreamCoordinator?
    var viewController: PhotoStreamViewController?
    
    override func setUp() {
        super.setUp()
        
        viewController = PhotoStreamViewController(nibName: "PhotoStreamViewController", bundle: nil)
        mockedCoordinator = MockedPhotoStreamCoordinator(parentViewController: UIViewController())
        viewController?.delegate = mockedCoordinator
        
        let photo = Photo(username: "Gonzalo",
                          title:"A photo",
                          date:"2016-12-01",
                          urlString: "")
        let photos: Array<Photo> = Array.init(repeating: photo, count: 1)
        let photoStreamDatasource = PhotoStreamDataSource(photos: photos )
        viewController?.datasource = photoStreamDatasource
    }
    
    override func tearDown() {
        mockedCoordinator = nil
        viewController = nil
        super.tearDown()
    }
    
    func testCallSelectPhoto() {
        XCTAssert(mockedCoordinator?.userSelectedPhotWasCalled == false)
        let indexPath = IndexPath(row: 0, section: 0)
        viewController?.selectedPhoto(at: indexPath)
        XCTAssert(mockedCoordinator?.userSelectedPhotWasCalled == true)
    }
}
