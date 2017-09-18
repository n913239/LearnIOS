//
//  ViewController.swift
//  MyBook
//
//  Created by mikewang on 2017/9/19.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pageViewController: UIPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        pageViewController = storyboard.instantiateViewController(withIdentifier: "pageViewController") as? UIPageViewController
        pageViewController?.dataSource = self
        
        
        pageViewController!.view.frame = self.view.frame
        if let okPageViewController = pageViewController {
            addChildViewController(okPageViewController)
            view.addSubview(okPageViewController.view)
        }
        pageViewController?.didMove(toParentViewController: self)
        
        guard let startPage = viewControllerAtIndex(index: 0) else { return }
        
        pageViewController?.setViewControllers([startPage], direction: .forward, animated: true, completion: nil)
        
    }

    
    

    func viewControllerAtIndex(index:Int) -> ContentViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contentViewController = storyboard.instantiateViewController(withIdentifier: "mainContentViewController") as? ContentViewController
        contentViewController?.nowPageNumber = index
        return contentViewController
    }

}

extension ViewController: UIPageViewControllerDataSource {
    
    // 回傳前一頁的內容
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = viewController as? ContentViewController
        guard var index = vc?.nowPageNumber else { return nil }
        if index == 0 || index == NSNotFound {
            return nil
        } else {
            index -= 1
            return viewControllerAtIndex(index: index)
        }
    }
    
    // 回傳下一頁的內容
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = viewController as? ContentViewController
        guard var index = vc?.nowPageNumber else { return nil }
        if index == NSNotFound {
            return nil
        } else {
            index += 1
            if index >= 3 {
                return nil
            } else {
                return viewControllerAtIndex(index: index)
            }
        }
    }
}
