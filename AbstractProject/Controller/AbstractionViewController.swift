//
//  ViewController.swift
//  AbstractProject
//
//  Created by Davis, Keenan on 12/4/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

public class AbstractionViewController: UIPageViewController, UIPageViewControllerDataSource
{

    //MARK:- Lifecycle methods
    public override func viewDidLoad()
    {
        super.viewDidLoad()
        dataSource = self
        
        if let firstViewController = orderedAbstractionViews.first
        {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    //MARK:- Data Members
    private lazy var orderedAbstractionViews : [UIViewController] =
    {
        return [
            self.newAbstractionViewController(abstractionLevel: "Swift"),
            self.newAbstractionViewController(abstractionLevel: "Block"),
            self.newAbstractionViewController(abstractionLevel: "ByteCode"),
            self.newAbstractionViewController(abstractionLevel: "Binary"),
            self.newAbstractionViewController(abstractionLevel: "LogicalGate")
        ]
    }()
    
    //MARK: Helper method to retrievee the correct viewController based on the data member
    private func newAbstractionViewController(abstractionLevel : String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(abstractionLevel)ViewController")
    }

    //MARK:- Datasource required methods
    /// Swipe Left
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore ViewController:
    UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = orderedAbstractionViews.index(of: viewController)
            else
        {
           return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0
            else
        {
            return orderedAbstractionViews.last
        }
        
        guard orderedAbstractionViews.count > previousIndex
            else
        {
           return nil
        }
    
        return orderedAbstractionViews[previousIndex]
    }
}

