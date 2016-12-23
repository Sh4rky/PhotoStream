//
//  PhotoStreamPresenter.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/22/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import Foundation
import Alamofire

class PhotoStreamPresenter: NSObject {
   
    weak var photoStreamViewController: PhotoStreamViewController?
    let queryStringURL: String = "https://api.flickr.com/services/feeds/photos_public.gne?tagmode=any&format=json&nojsoncallback=1"
    let networkManager: NetworkManager
    
    static func createViewController(networkManager: NetworkManager) -> PhotoStreamViewController {
        let photoStreamVC = PhotoStreamViewController(nibName: "PhotoStreamViewController", bundle: nil)//TODO set a nib name
        let presenter = PhotoStreamPresenter(viewController:photoStreamVC, networkManager: networkManager)
        photoStreamVC.presenter = presenter
        return photoStreamVC
    }
    
    init(viewController: PhotoStreamViewController, networkManager: NetworkManager) {
        self.photoStreamViewController = viewController
        self.networkManager = networkManager
        super.init()
    }
    
    func loadView() {
        //Network request to retrieve photos
        retrievePhotos()
    }
    
    func retrievePhotos() {
        
        networkManager.request(urlString: queryStringURL,
                               completionHandler: { response in
            print(response!)
            //JSONSerialization.JSONObjectWithData()
        })
    }
}
