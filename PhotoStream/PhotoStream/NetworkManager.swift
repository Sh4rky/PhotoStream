//
//  NetworkManager.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/22/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import UIKit
import Alamofire

enum NetworkError: Error {
    case Failure
    case InvalidURL
}

struct LocalizedErrorMessages {

}

class NetworkManager: NSObject {

    func request(urlString: String, completionHandler:@escaping (_ response: Dictionary<String, Any>?, _ error: NetworkError?) -> Void) {
    
        guard let url = URL(string: urlString)
            else {
                completionHandler(nil, NetworkError.InvalidURL)
                return
        }
        Alamofire.request(url).response { (response) in
            guard let data = response.data else { return }
            var json: Dictionary<String, Any> = Dictionary()
            do {
                json = try JSONSerialization.jsonObject(with: data,
                                                        options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
            }
            catch {
                completionHandler(nil, NetworkError.Failure)
                return
            }
            
            completionHandler(json, nil)
        }

    }
}
