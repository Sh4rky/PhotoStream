//
//  ViewController.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/22/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import UIKit

class PhotoStreamViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: PhotoStreamPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadView()
    }

}

