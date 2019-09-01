//
//  JMYItemViewController.swift
//  ExpirationDate
//
//  Created by JiminYoo on 26/08/2019.
//  Copyright © 2019 Jimin Yoo. All rights reserved.
//

import UIKit

class JMYItemViewController: JMYViewController {

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
        
        if let navigationController = self.navigationController, navigationController.viewControllers.count > 1 {
        
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @objc
    private func touchUpInsideDoneBarButtonItem(_ sender: UIBarButtonItem) {
        
        
    }

}
