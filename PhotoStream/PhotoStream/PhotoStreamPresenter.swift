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
    let queryStringURL: String = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=?"
    let networkManager: NetworkManager
    
    static func createViewController(networkManager: NetworkManager) -> PhotoStreamViewController {
        let photoStreamVC = PhotoStreamViewController(nibName: "PhotoStreamViewController", bundle: nil)
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
        
        self.photoStreamViewController?.showLoadingOverlay()
        networkManager.request(urlString: queryStringURL,
                               completionHandler: { [unowned self](response, error)  in
                                
                                if error != nil {
                                    self.photoStreamViewController?.showErrorMessage(message: self.errorMessage(errorType: error!))
                                }
                                else {
                                    guard let jsonResponse = response else { return }
                                    
                                    self.parsePhotos(jsonResponse, completionHandler: { [unowned self] (photos) in
                                        self.photoStreamViewController?.updatePhotoDatasource(photos: photos)
                                        self.photoStreamViewController?.collectionView.reloadData()
                                        self.photoStreamViewController?.hideLoadingOverlay()
                                    })
                                }
        })
    }
    
    func parsePhotos(_ jsonResponse: Dictionary<String,Any>, completionHandler:@escaping ([Photo]) -> Void)  {
        
        DispatchQueue.global(qos: .background).async {
            let items: [Dictionary<String,Any>] = jsonResponse["items"] as! [Dictionary<String,Any>]
            var photos: [Photo] = []
            for photoJSON in items {
                let photo = Photo.createPhoto(dictionary: photoJSON)
                photos.append(photo)
            }
            DispatchQueue.main.async {
                completionHandler(photos)
            }
        }
    }
    
    func errorMessage(errorType: NetworkError) -> String {
        switch errorType {
        case .Failure:
            return NSLocalizedString("There's been a network error, please try again", comment:"network error failure explanation")
        case .InvalidURL:
            return NSLocalizedString("The URL is invalid", comment:"network error invalid url")
        }
    }
}
