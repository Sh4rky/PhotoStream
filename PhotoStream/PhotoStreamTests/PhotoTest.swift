//
//  Photo.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/24/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import XCTest
@testable import PhotoStream

class PhotoTest: XCTestCase {
    
    var photo: Photo?
    
    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: type(of: self))
        let photosJSONPath = bundle.path(forResource: "photoJSON", ofType: "")
        let jsonData: Data = try! NSData(contentsOfFile: photosJSONPath!) as Data
        let json = try! JSONSerialization.jsonObject(with: jsonData,
                                                     options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, AnyObject>
        photo = Photo.createPhoto(dictionary: json)
    }
    
    override func tearDown() {
        photo = nil
        super.tearDown()
    }
    
    func testTestCreation() {
        XCTAssertTrue(photo?.title == "Bix 1302 Liancourt - BWM 018.jpg" )
        XCTAssertTrue(photo?.url == URL(string:"https://farm1.staticflickr.com/430/30988502934_c00587d62f_m.jpg"))
        XCTAssertTrue(photo?.username == "nobody@flickr.com (\"etienne.raeymaekers\")")
        XCTAssertTrue(photo?.date == "2013-02-09T17:16:23-08:00")
    }
}
