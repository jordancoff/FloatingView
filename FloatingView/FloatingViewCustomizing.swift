//
//  FloatingViewCustomizing.swift
//  FloatingView
//
//  Created by Jordan Coff on 12/30/20.
//  Copyright © 2020 Jordan Coff. All rights reserved.
//

import UIKit

/**
 * Protocol that a view controller or navigation controller can conform to customize the
 * presentation of a floating view in the navigation controller's view hierarchy.
 */
protocol FloatingViewCustomizing {
    func shouldShowButton() -> Bool
    func createConstraints(floatingView: UIView, superview: UIView)
}

extension FloatingViewCustomizing {
    func shouldShowButton() -> Bool {
        return true
    }

    func createConstraints(floatingView: UIView, superview: UIView) {
        NSLayoutConstraint.activate([
            floatingView.bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: 8),
            floatingView.centerXAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
}
