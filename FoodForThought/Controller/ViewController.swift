//
//  ViewController.swift
//  FoodForThought
//
//  Created by Ryan Morrison on 07/09/2017.
//  Copyright © 2017 egoDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageBG: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addParallaxToView(vw: imageBG, amount: 30)
    }



}

