//
//  PhotoStreamDataSourceTest.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/22/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import XCTest
@testable import PhotoStream

class PhotoStreamDataSourceTest: XCTestCase {
    
    var photoStreamDatasource: PhotoStreamDataSource?
    var collectionView: UICollectionView?

    override func setUp() {
        super.setUp()
        
        let photo:Photo = Photo(username: "Gonzalo",
                                title:"A photo",
                                date:"2016-12-01",
                                urlString: "")
        let photos: [Photo] = Array(repeating: photo, count: 1)
        photoStreamDatasource = PhotoStreamDataSource(photos: photos)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 100, height: 100)
        self.collectionView = UICollectionView.init(frame: CGRect(x:0, y:0, width:0, height:0), collectionViewLayout: layout)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCellSetup() {
        let cell = self.photoStreamDatasource?.setupCellImageView(row: 0,
                                                                  cell: UICollectionViewCell.init(frame: CGRect(x:0,y:0, width:0, height:0)))
        XCTAssertNotNil(cell)
        XCTAssertTrue((cell?.contentView.subviews.count)! > 0)
    }
    
    func testNumberOfRows() {
        let rowsCounter = self.photoStreamDatasource?.collectionView(self.collectionView!, numberOfItemsInSection: 0)
        XCTAssertTrue(rowsCounter == 1)
    }
    
}
