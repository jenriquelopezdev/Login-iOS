//
//  MainNavigationController.swift
//  geko test
//
//  Created by juan on 19/03/19.
//  Copyright © 2019 Enrique Lopez. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        var isLop = false
//
//        if isLop {
//            //assume user is logged in
//            goToLoginWelcome()
//        } else {
            goToMainView()
//        }
    }
    
    func goToLoginWelcome() {
        let homeController = LoginWelcomeViewController()
        viewControllers = [homeController]
    }
    
    func goToMainView() {
        let homeController = MainViewController()
        viewControllers = [homeController]
    }
}
