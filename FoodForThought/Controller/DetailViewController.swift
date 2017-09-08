//
//  DetailViewController.swift
//  Big Bowl
//
//  Created by Ryan Morrison on 08/09/2017.
//  Copyright © 2017 egoDev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var addressButtonStyle: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addParallaxToView(vw: imageView, amount: 10)
        
    }

}
