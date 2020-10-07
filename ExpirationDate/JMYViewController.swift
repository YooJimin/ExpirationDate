//
//  JMYViewController.swift
//  FoodInventory
//
//  Created by JiminYoo on 09/06/2019.
//  Copyright © 2019 Jimin Yoo. All rights reserved.
//

import UIKit

class JMYViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupDefaults()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.updateNavigationBar()

    }
    
    // MARK: - NavigationBar

    func setupDefaults() {
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    func updateNavigationBar() {
        
        // bar background color
        self.navigationController?.navigationBar.barTintColor = .white
        // bar item color
        self.navigationController?.navigationBar.tintColor = .black
        // title color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                                        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20.0)]

    }
    
}
