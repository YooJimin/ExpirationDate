//
//  JMYStockViewController.swift
//  FoodInventory
//
//  Created by JiminYoo on 01/08/2019.
//  Copyright © 2019 Jimin Yoo. All rights reserved.
//

import UIKit

class JMYStockViewController: JMYViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavigationBar()
        self.setupViews()
    }
    
    private func setupNavigationBar() {
        
//        self.navigationController?.navigationBar.topItem?.title
//        self.title
//        self.navigationItem.title = "yy_품목"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(touchUpInsideCancelBarButtonItem(_:)))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(touchUpInsideDoneBarButtonItem(_:)))
        
    }
    
    private func setupViews() {
        
        
        
    }
    
    // MARK: - Action
    
    @objc
    private func touchUpInsideCancelBarButtonItem(_ sender: UIBarButtonItem) {
        
        
    }
    
    @objc
    private func touchUpInsideDoneBarButtonItem(_ sender: UIBarButtonItem) {
        
        
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
