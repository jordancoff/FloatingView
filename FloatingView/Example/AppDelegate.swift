//
//  AppDelegate.swift
//  FloatingView
//
//  Created by Jordan Coff on 12/24/20.
//  Copyright © 2020 Jordan Coff. All rights reserved.
//

import UIKit
import SafariServices

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        let vc = ViewController(nibName: nil, bundle: nil, showsButton: true)
        vc.view.backgroundColor = .lightGray

        let floatingButton = UIButton(type: .custom)
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        floatingButton.setTitle("Floating Button", for: .normal)
        floatingButton.titleLabel?.font = .preferredFont(forTextStyle: .title1)
        floatingButton.setTitleColor(.black, for: .normal)
        floatingButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        floatingButton.contentEdgeInsets = .init(top: 8, left: 20, bottom: 8, right: 20)
        floatingButton.backgroundColor = .yellow
        let floatingViewManager = FloatingViewManager(floatingView: floatingButton)

        let nav = UINavigationController(rootViewController: vc,
                                         floatingViewManager: floatingViewManager)
        window.rootViewController = nav
        self.window = window
        self.navigationController = nav
        window.makeKeyAndVisible()
        return true
    }

    @objc func didTapButton() {
        guard let url = URL(string: "https://google.com") else { return }
        let safariViewController = SFSafariViewController(url: url)
        navigationController?.present(safariViewController, animated: true, completion: nil)
    }
}
