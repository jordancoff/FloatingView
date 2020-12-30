//
//  UINavigationController+FloatingViewManager.swift
//  FloatingView
//
//  Created by Jordan Coff on 12/30/20.
//  Copyright © 2020 Jordan Coff. All rights reserved.
//

import UIKit

private var associateKey: Void?

extension UINavigationController {
    var floatingViewManager: FloatingViewManager? {
        get {
            objc_getAssociatedObject(self, &associateKey) as? FloatingViewManager
        }
        set {
            delegate = newValue
            objc_setAssociatedObject(self, &associateKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    convenience init(rootViewController: UIViewController,
                     floatingViewManager: FloatingViewManager) {
        self.init(rootViewController: rootViewController)
        self.floatingViewManager = floatingViewManager
    }
}
