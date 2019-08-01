//
//  JMYPositionViewController.swift
//  FoodInventory
//
//  Created by JiminYoo on 09/06/2019.
//  Copyright © 2019 Jimin Yoo. All rights reserved.
//

import UIKit

class JMYPositionViewController: JMYViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
self.title = "test"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.perform(#selector(test), with: nil, afterDelay: 1.0)
    }

    @objc func test() {
        
        self.navigationController?.pushViewController(JMYInventoryViewController(), animated: true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
