//
//  NetworkManager.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/22/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import UIKit
import Alamofire

class NetworkManager: NSObject {

    func request(urlString: String, completionHandler:@escaping (_ response: Dictionary<String, Any>?) -> Void) {
    
        guard let url = URL(string: urlString)
            else {
                completionHandler(nil)
                return
        }
        Alamofire.request(url).response { (response) in
            guard let data = response.data else { return }
            let result = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            
            print(result!)
            var json: Dictionary<String, Any> = Dictionary()
            do {
                json = try JSONSerialization.jsonObject(with: data,
                                                        options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
            }
            catch {
                completionHandler(nil)
            }
            
            completionHandler(json)
        }

    }
}
