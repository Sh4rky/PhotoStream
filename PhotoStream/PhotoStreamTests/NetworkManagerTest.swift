//
//  NetworkManagerTest.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/24/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import XCTest
@testable import PhotoStream

class NetworkManagerTest: XCTestCase {
    
    var networkManager: NetworkManager?
    
    override func setUp() {
        super.setUp()
        networkManager = NetworkManager()
    }
    
    override func tearDown() {
        networkManager = nil
        super.tearDown()
    }
    
    func testInvalidUrl() {
        networkManager?.request(urlString: "http:\\789-._~:/?#", completionHandler: { (response, error) in
            XCTAssertTrue(response == nil)
            XCTAssertTrue(error == NetworkError.InvalidURL)
        })
    }
    
    func testValidUrl() {
        networkManager?.request(urlString: "http://www.google.com/", completionHandler: { (response, error) in
            XCTAssertTrue(response == nil)
            XCTAssertTrue(error == NetworkError.Failure)
        })
    }
    
    func testInvalidParsing() {
        if let json: Dictionary<String, AnyObject> = networkManager?.parseJSON(data: Data()) {
            XCTAssertFalse(json.count > 0)
        }
        else {
            XCTAssertTrue(true)
        }
    }
}
