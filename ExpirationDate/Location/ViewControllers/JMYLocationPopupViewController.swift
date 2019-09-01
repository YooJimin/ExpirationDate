//
//  JMYLocationPopupViewController.swift
//  ExpirationDate
//
//  Created by JiminYoo on 27/08/2019.
//  Copyright © 2019 Jimin Yoo. All rights reserved.
//

import UIKit

class JMYLocationPopupViewController: JMYViewController {

    @IBOutlet weak var popupContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViews()
    }

    func setupViews() {
        self.popupContainerView.clipsToBounds = true
        self.popupContainerView.layer.cornerRadius = 15.0
        self.cancelButton.layer.cornerRadius = 5.0
        self.okButton.layer.cornerRadius = 5.0
    }

    @IBAction func touchUpInsideCancelButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func touchUpInsideOkButton(_ sender: Any) {
    }
}