//
//  JMYLocationPopupViewController.swift
//  ExpirationDate
//
//  Created by JiminYoo on 27/08/2019.
//  Copyright © 2019 Jimin Yoo. All rights reserved.
//

import UIKit

class JMYLocationPopupViewController: JMYViewController {

    var originalName: String?
    var completion: (() -> Void)?
    
    var filteredName: String {
        return self.nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    }
    
    @IBOutlet weak var popupContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    @IBOutlet weak var popupContainerViewCenterYConstraint: NSLayoutConstraint!
    @IBOutlet weak var popupContainerViewBottomConstraint: NSLayoutConstraint!
    
    init(name: String? = nil, completion: (() -> Void)?) {
        super.init(nibName: nil, bundle: nil)
        
        self.originalName = name
        self.completion = completion
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerNotifications()
        self.setupViews()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK:- Notifications
    
    func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    func keyboardWillShow(_ notification: Notification) {
        let popupViewMaxY = self.popupContainerView.frame.maxY
        if let keyboard = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
            popupViewMaxY + 20 > keyboard.minY {
            self.popupContainerViewCenterYConstraint.constant = popupViewMaxY + 20 - keyboard.minY
        }
        
        UIView.animate(withDuration: notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0.25, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
            self?.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @objc
    func keyboardWillHide(_ notification: Notification) {
        self.popupContainerViewCenterYConstraint.constant = 0
        UIView.animate(withDuration: notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0.25, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
            self?.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    // MARK:- Setups
    
    func setupViews() {
        self.popupContainerView.clipsToBounds = true
        self.popupContainerView.layer.cornerRadius = 15.0
        self.cancelButton.layer.cornerRadius = 5.0
        self.okButton.layer.cornerRadius = 5.0
        
        self.nameTextField.text = self.originalName
        self.nameTextField.becomeFirstResponder()
        
        self.updateControls()
    }
    
    func updateControls() {
        let isEnabled = !self.filteredName.isEmpty
        self.okButton.backgroundColor = isEnabled ? .orange : .gray
        self.okButton.isEnabled = isEnabled
    }
    
    // MARK:- actions
    
    @IBAction func touchUpInsideCancelButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func touchUpInsideOkButton(_ sender: Any) {
        
        if let name = self.nameTextField.text, !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            
            do {
                try DataBaseManager.shared.createLocation(name: name)
                
                self.completion?()
                
            } catch {
                print(error.localizedDescription)
            }
            
            self.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func tapGesture(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func textFieldValueChanged(_ textField: UITextField) {
        
        guard textField === self.nameTextField, textField.text != self.filteredName else { return }
        
        textField.text = self.filteredName
        
        self.updateControls()
    }
}
