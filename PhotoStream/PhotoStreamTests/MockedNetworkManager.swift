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

    override func request(urlString: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        let response = ["key": "value"]
        completionHandler(response)
    }
}
