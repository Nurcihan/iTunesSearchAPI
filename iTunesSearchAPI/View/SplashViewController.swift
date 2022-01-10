//
//  SplashViewController.swift
//  SearchAPI
//
//  Created by Nurcihan Karayakalı on 5.01.2022.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: SearchViewController())
    }
    
   

}
