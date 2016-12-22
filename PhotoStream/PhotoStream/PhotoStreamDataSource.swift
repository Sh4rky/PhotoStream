//
//  PhotoStreamDataSource.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/22/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoStreamDataSource:NSObject, UICollectionViewDataSource {

    var photos: Array<Photo>
    static let cellIdentifier = "PhotoCellIdentifier"
    let placeholderImage = UIImage(named: "no_image")!
    
    init(photos: Array<Photo> ) {
        self.photos = photos
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoStreamDataSource.cellIdentifier, for: indexPath)
        
        return setupCellImageView(row: indexPath.row, cell: cell)
    }
    
    func setupCellImageView(row: Int, cell: UICollectionViewCell) -> UICollectionViewCell {
        let imageView = UIImageView(frame: cell.contentView.frame)
        
        let photo = self.photos[row]
        
        let filter = AspectScaledToFitSizeFilter (
            size: imageView.frame.size
        )
        
        imageView.af_setImage(
            withURL: photo.url,
            placeholderImage: placeholderImage,
            filter: filter,
            imageTransition: .crossDissolve(0.2)
        )
        
        cell.contentView.addSubview(imageView)
        return cell
    }
}
