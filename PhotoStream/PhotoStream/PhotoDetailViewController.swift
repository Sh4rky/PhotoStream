//
//  PhotoDetailViewController.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/23/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let placeholderImage = UIImage(named: "no_image")!
    var photo: Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("Photo Details", comment: "title for photo stream details section")
        setupUI()
    }
    
    func setupUI() {
        let filter = AspectScaledToFitSizeFilter (
            size: self.imageView.frame.size
        )
        
        self.imageView.af_setImage(
            withURL: (photo?.url)!,
            placeholderImage: placeholderImage,
            filter: filter,
            imageTransition: .crossDissolve(0.2)
        )
        
        self.titleLabel.text = photo?.title
    }
}
