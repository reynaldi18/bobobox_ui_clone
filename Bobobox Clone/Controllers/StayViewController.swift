//
//  StayViewController.swift
//  Bobobox Clone
//
//  Created by Reynaldi Pamungkas on 11/08/22.
//

import UIKit
class StayViewController: BaseViewController {
    @IBOutlet weak var toolbarView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        toolbarView.dropShadow()
    }
}
