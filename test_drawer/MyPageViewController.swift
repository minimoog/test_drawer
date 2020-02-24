//
//  MyPageViewController.swift
//  test_drawer
//
//  Created by Antonie Jovanoski on 2/24/20.
//  Copyright © 2020 Antonie Jovanoski. All rights reserved.
//

import UIKit

class MyPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var tableViewController: TableViewController?
    var labelViewController: LabelViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        tableViewController = (storyboard?.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController)
        labelViewController = (storyboard?.instantiateViewController(withIdentifier: "LabelViewController") as! LabelViewController)
        
        setViewControllers([tableViewController!], direction: .forward, animated: true, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let _ = viewController as? TableViewController {
            return nil
        } else if let _ = viewController as? LabelViewController {
            return tableViewController
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let _ = viewController as? TableViewController {
            return labelViewController
        } else if let _ = viewController as? LabelViewController {
            return nil
        }
        
        return nil
    }
}
