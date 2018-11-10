//
//  MFNavigationBarAppearingController.swift
//  MFNavigationBarAppearing
//
//  Created by Max on 10/31/18.
//  Copyright © 2018 molfar.io. All rights reserved.
//

import UIKit


open class MFNavigationBarAppearingController: UINavigationController {
    
    public var appearingNavigationBar: MFAppearingNavigationBar? {
        return navigationBar as? MFAppearingNavigationBar
    }
    
    convenience init() {
        self.init(navigationBarClass: MFAppearingNavigationBar.self, toolbarClass: nil)
    }
    
    public convenience override init(rootViewController: UIViewController) {
        self.init()
        
        appearingNavigationBar?.appearer = rootViewController as? MFNavigationBarAppearer
        viewControllers = [rootViewController]
        
        let viewColor = rootViewController.view.backgroundColor
        if appearingNavigationBar?.navigationBarColor == nil {
           appearingNavigationBar?.navigationBarColor = viewColor
        }
    }
    
    override open func pushViewController(_ viewController: UIViewController, animated: Bool) {
        appearingNavigationBar?.appearer = viewController as? MFNavigationBarAppearer
        super.pushViewController(viewController, animated: animated)
    }
    
    override open func popViewController(animated: Bool) -> UIViewController? {
        let popedViewController = super.popViewController(animated: animated)
        appearingNavigationBar?.appearer = popedViewController as? MFNavigationBarAppearer
        return popedViewController
    }
}
