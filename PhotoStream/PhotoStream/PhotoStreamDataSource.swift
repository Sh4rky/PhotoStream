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
    static let imageFrameThickness: CGFloat = 5
    static let imageViewTag = 201612251007
    let placeholderImage = UIImage(named: "no_image")!
    
    init(photos: [Photo] ) {
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
       

        var imageView: UIImageView
        if  cell.contentView.viewWithTag(PhotoStreamDataSource.imageViewTag) == nil {
            imageView = UIImageView(frame: cell.contentView.frame)
            imageView.tag = PhotoStreamDataSource.imageViewTag
        }
        else {
            imageView = cell.contentView.viewWithTag(PhotoStreamDataSource.imageViewTag) as! UIImageView
        }
        
        let photo = self.photos[row]
        
        let filter = AspectScaledToFitSizeFilter (
            size: cell.frame.size
        )
        
        imageView.af_setImage(
            withURL: photo.url,
            placeholderImage: placeholderImage,
            filter: filter,
            imageTransition: .crossDissolve(0.2)
        )
        
        cell.contentView.backgroundColor = .black
        cell.contentView.addSubview(imageView)
        
        return cell
    }
}
