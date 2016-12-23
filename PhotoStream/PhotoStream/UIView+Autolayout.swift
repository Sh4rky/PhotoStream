//
//  UIView+Autolayout.swift
//  PhotoStream
//
//  Created by Gonzalo Erro on 12/23/16.
//  Copyright © 2016 Gonzalo's. All rights reserved.
//

import UIKit

extension UIView {
    
    func addAndAttachViewToMargins(view: UIView) {
        view.frame = self.bounds
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let viewReferences = ["view": view]
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                                   options: NSLayoutFormatOptions(rawValue: 0),
                                                                   metrics: nil, views: viewReferences))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                                   options: NSLayoutFormatOptions(rawValue: 0),
                                                                   metrics: nil, views: viewReferences))
    }
}
