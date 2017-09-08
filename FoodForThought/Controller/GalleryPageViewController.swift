//
//  GalleryPageViewController.swift
//  Big Bowl
//
//  Created by Ryan Morrison on 08/09/2017.
//  Copyright © 2017 egoDev. All rights reserved.
//

import UIKit

class GalleryPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    var imageArray = ["placeholder2", "placeholder3", "placeholder4", "placeholder"]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.setViewControllers([getViewControllerAtIndex(index: 0)], direction: .forward, animated: false, completion: nil)
        
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        index -= 1
        
        guard index >= 0 else {
            index = imageArray.count - 1
            return getViewControllerAtIndex(index: index)
        }
        guard imageArray.count > index else {
            return nil
        }
        
        return getViewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        index += 1
        
        guard imageArray.count != index else {
            index = 0
            return getViewControllerAtIndex(index: index)
        }
        
        guard imageArray.count > index else {
            return nil
        }
        
        return getViewControllerAtIndex(index: index)
    }
  
    func getViewControllerAtIndex(index: Int) -> GalleryViewController {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GalleryController") as! GalleryViewController
        vc.imageName = imageArray[index]
        return vc
    }

}
