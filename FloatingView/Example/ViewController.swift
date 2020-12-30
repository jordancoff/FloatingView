//
//  ViewController.swift
//  FloatingView
//
//  Created by Jordan Coff on 12/24/20.
//  Copyright © 2020 Jordan Coff. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FloatingViewCustomizing {

    let showsButton: Bool

    let bottomView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .random
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return view
    }()

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, showsButton: Bool) {
        self.showsButton = showsButton
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        func createButton(_ yesOrNo: Bool) -> UIButton {
            let button = UIButton(type: .roundedRect)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = yesOrNo ? .green : .red
            button.setTitle(yesOrNo ? "Push w/ button" : "Push w/o button", for: .normal)
            button.contentEdgeInsets = .init(top: 8, left: 8, bottom: 8, right: 8)
            let selector = yesOrNo ? #selector(pushWithYes) : #selector(pushWithNo)
            button.addTarget(self, action: selector, for: .touchUpInside)
            return button
        }

        let stack = UIStackView(arrangedSubviews: [createButton(true), createButton(false)])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal

        view.addSubview(stack)
        stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.backgroundColor = .lightGray

        view.addSubview(bottomView)
        bottomView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bottomView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    @objc func pushWithYes() {
        push(true)
    }

    @objc func pushWithNo() {
        push(false)
    }

    func push(_ showButton: Bool) {
        let vc = ViewController(nibName: nil, bundle: nil, showsButton: showButton)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: - FloatingViewCustomizing

    func shouldShowButton() -> Bool {
        return showsButton
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
