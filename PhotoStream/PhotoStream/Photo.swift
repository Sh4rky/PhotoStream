//
//  Photo.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/22/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import UIKit

class Photo: NSObject {
    
    static let noPhotoURLString: String = "https://cdn3.iconfinder.com/data/icons/abstract-1/512/no_image-128.png"
    
    var username: String
    var title: String
    var date: String
    var url: URL
    
    init(username: String, title: String, date:String, urlString:String) {
        
        self.username = username
        self.title = title
        self.date = date
        self.url = URL(string: urlString) ?? URL(string:Photo.noPhotoURLString)!

        super.init()
    }
    
    static func createPhoto(dictionary: Dictionary<String, Any>) -> Photo {
    
        let title = dictionary["title"] as! String
        let imageDictionary = dictionary["media"] as! Dictionary<String,Any>
        let stringUrl = imageDictionary["m"] as! String
        let dateTaken = dictionary["date_taken"] as! String
        let username = dictionary["author"] as! String
        return Photo(username: username, title: title, date: dateTaken, urlString: stringUrl)
    }
}
