//
//  GalleryViewController.swift
//  FoodForThought
//
//  Created by Ryan Morrison on 07/09/2017.
//  Copyright © 2017 egoDev. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageName)
        addParallaxToView(vw: imageView, amount: 40)
    }
    
}
