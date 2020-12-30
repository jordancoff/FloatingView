//
//  FloatingViewManager.swift
//  FloatingView
//
//  Created by Jordan Coff on 12/25/20.
//  Copyright © 2020 Jordan Coff. All rights reserved.
//

import UIKit

/**
 * Manages the presentation of a floating view in the navigation controller's view hierarchy.
 *
 * When set as the navigation controller's delegate, this class will add its floating view to the
 * hierarchy and offer hooks for customization when a view controller is shown.
 *
 * Customization is offered via the `FloatingViewCustomizing` protocol. The view
 * controller and/or the navigation controller can conform to the protocol. If both, the view
 * controller takes precedence.
 */
class FloatingViewManager: NSObject, UINavigationControllerDelegate {

    let floatingView: UIView

    init(floatingView: UIView) {
        self.floatingView = floatingView
        super.init()
    }

    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        let shouldShowButton = self.shouldShowButton(forViewController: viewController,
                                                     navigationController: navigationController)
        floatingView.isHidden = !shouldShowButton
        floatingView.removeFromSuperview()

        if shouldShowButton {
            navigationController.view.addSubview(floatingView)
            createConstraints(forViewController: viewController,
                              navigationController: navigationController)
        }
    }

    private func firstfloatingViewCustomizing(
        forViewController viewController: UIViewController,
        navigationController: UINavigationController
    ) -> FloatingViewCustomizing? {
        return [viewController, navigationController]
            .compactMap({ $0 as? FloatingViewCustomizing })
            .first
    }

    private func shouldShowButton(forViewController viewController: UIViewController,
                                  navigationController: UINavigationController) -> Bool {
        if let first = firstfloatingViewCustomizing(forViewController: viewController,
                                                       navigationController: navigationController) {
            return first.shouldShowButton()
        }
        return true
    }

    private func createConstraints(forViewController viewController: UIViewController,
                                   navigationController: UINavigationController) {
        if let first = firstfloatingViewCustomizing(forViewController: viewController,
                                                       navigationController: navigationController) {
            first.createConstraints(floatingView: floatingView,
                                    superview: navigationController.view)
        }
    }
}
