//
//  MockedNetworkManager.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/22/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import UIKit
@testable import PhotoStream

class MockedNetworkManager: NetworkManager {

    override func request(urlString: String,
                          completionHandler:@escaping (_ response: Dictionary<String, AnyObject>?, _ error: NetworkError?) -> Void) {
        let bundle = Bundle(for: type(of: self))
        let photosJSONPath = bundle.path(forResource: "photosJSON", ofType: "")

        var jsonData: Data
        do {
            jsonData = try NSData(contentsOfFile: photosJSONPath!) as Data
        }
        catch {
            completionHandler(nil, NetworkError.Failure)
            return
        }
        
        guard let json = self.parseJSON(data: jsonData) else { completionHandler(nil, .Failure); return}
        completionHandler(json, nil)
    }
}
