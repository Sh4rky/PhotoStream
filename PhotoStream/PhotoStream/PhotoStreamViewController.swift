//
//  ViewController.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/22/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import UIKit

protocol PhotoStreamViewControllerDelegate: class {
    func userSelectedPhoto(photo: Photo)
}

class PhotoStreamViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var datasource: PhotoStreamDataSource?
    var presenter: PhotoStreamPresenter?
    
    weak var delegate:PhotoStreamViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Photo Stream", comment: "title for photo stream section")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: PhotoStreamDataSource.cellIdentifier)
        collectionView.allowsSelection = true
        self.collectionView.backgroundColor = .darkGray
        self.collectionView.delegate = self
        
        
        presenter?.loadView()
    }
    
    func updatePhotoDatasource(photos: [Photo]) {
        
        if self.datasource == nil {
            datasource = PhotoStreamDataSource(photos: photos)
            collectionView.dataSource = datasource
        }
        else {
            datasource?.photos = photos
        }
        
        self.collectionView.reloadData()
    }
    
    func showErrorMessage(message: String) {
        
        let alertView = UIAlertView(title: NSLocalizedString("Error!", comment: "network error title"),
                                    message: message, delegate: self,
                                    cancelButtonTitle: NSLocalizedString("Ok", comment: "aknowledge action"))
        alertView.show()
    }
    
    func selectedPhoto(at: IndexPath) {
        let item = self.datasource?.photos[at.row]
        let selectedPhoto: Photo =  item! as Photo
        self.delegate?.userSelectedPhoto(photo: selectedPhoto)
    }
}

extension PhotoStreamViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        collectionView.collectionViewLayout.invalidateLayout()
        let selectedCell: UICollectionViewCell = self.collectionView.cellForItem(at: indexPath)!
        
        let animationClosureIn = { [unowned selectedCell] in
            selectedCell.backgroundColor = .white
        }
        
        UIView.transition(with: selectedCell,
                          duration: 1.0,
                          options: UIViewAnimationOptions.curveEaseInOut,
                          animations: animationClosureIn,
                          completion: {
                            [unowned selectedCell] (Bool) in
                            selectedCell.backgroundColor = .black
        })
        
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedPhoto(at: indexPath)
    }
}

extension PhotoStreamViewController: UIAlertViewDelegate {

    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        self.presenter?.loadView()
        alertView.dismiss(withClickedButtonIndex: buttonIndex, animated: true)
    }
}

