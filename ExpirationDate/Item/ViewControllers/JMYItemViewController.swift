//
//  JMYItemViewController.swift
//  ExpirationDate
//
//  Created by JiminYoo on 26/08/2019.
//  Copyright © 2019 Jimin Yoo. All rights reserved.
//

import UIKit

class JMYItemViewController: JMYViewController {

    @IBOutlet weak var imageView: UIImageView!
    
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

    @IBAction func touchUpInsideImageViewContainerControl(_ sender: Any) {
        
        let completion: ((UIImagePickerController.SourceType) -> Void)? = { (sourceType) in
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = sourceType
            imagePickerController.allowsEditing = true
            
            if sourceType == .camera {
                imagePickerController.modalPresentationStyle = .fullScreen
                imagePickerController.cameraCaptureMode = .photo
                
            } else {
                
                imagePickerController.modalPresentationStyle = .popover
                if let popover = imagePickerController.popoverPresentationController, let control = sender as? UIControl {
                    popover.sourceView = control
                    popover.sourceRect = control.bounds
                }
            }
            
            self.present(imagePickerController, animated: true, completion: nil)
        }
        
    
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (_) in
                completion?(.photoLibrary)
            }))
        }
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (_) in
                completion?(.camera)
            }))
        }
        
        guard !actionSheet.actions.isEmpty else { return }
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
}

extension JMYItemViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.imageView.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
}
