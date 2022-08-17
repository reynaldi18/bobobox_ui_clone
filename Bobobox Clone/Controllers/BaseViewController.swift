//
//  BaseViewController.swift
//  Bobobox Clone
//
//  Created by Reynaldi Pamungkas on 10/08/22.
//

import Foundation
import UIKit
class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    private func setupNavigation() {
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    func setupLeftBarButtonItems(title: String = "", back: Bool = false, handleBack: Selector? = nil) {
        var items = [UIBarButtonItem]()
        if back {
            let button = UIButton(type: .custom)
            button.setImage(#imageLiteral(resourceName: "ic_back_new").withRenderingMode(.alwaysTemplate), for: .normal)
            if let  handleBack = handleBack {
                button.addTarget(self, action:handleBack, for: .touchUpInside)
            } else {
                button.addTarget(self, action:#selector(backPressed), for: .touchUpInside)
            }
            button.frame = CGRect(x: 0, y: 0, width: 28, height: 60)
            button.widthAnchor.constraint(equalToConstant: button.frame.width).isActive = true
            button.tintColor = UIColor.blue

            let barButtonItemMenu = UIBarButtonItem()
            barButtonItemMenu.customView = button
            items.append(barButtonItemMenu)
        }
        self.navigationItem.leftBarButtonItems = items
        let navLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
            navLabel.text = "  "+title
        navLabel.textAlignment = .left
        navLabel.textColor = UIColor.blue
        self.navigationItem.titleView = navLabel
    }
    @objc func backPressed(_ sender: UIBarButtonItem) {
        if isModal() {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    private func isModal() -> Bool {
        if self.navigationController?.viewControllers.count == 1 {
            return true
        }
        return false
    }
}
