//
//  OwnerDashboardViewController.swift
//  pawsome
//
//  Created by Roch on 29/03/2022.
//

import UIKit

class OwnerDashboardViewController: UIViewController {
    
    let walkerService = WalkerService()
    var walkerList = [Walker]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        walkerService.getAllWalker() {success, message, data in
            self.walkerList = data
        }
    }

}
