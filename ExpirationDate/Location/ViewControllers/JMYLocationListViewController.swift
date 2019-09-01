//
//  JMYLocationListViewController.swift
//  FoodInventory
//
//  Created by JiminYoo on 09/06/2019.
//  Copyright © 2019 Jimin Yoo. All rights reserved.
//

import UIKit

class JMYLocationListViewController: JMYViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavigationBar()
        self.setupViews()

    }
    
    func setupNavigationBar() {
        
        self.title = "test"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.bookmarks, target: self, action: #selector(touchUpInsideMenuButton(_:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(touchUpInsideAddButton(_:)))
        
    }
    
    func setupViews() {
        
        self.collectionView.register(UINib(nibName: String(describing: JMYLocationListCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: JMYLocationListCell.self))
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        self.perform(#selector(test), with: nil, afterDelay: 1.0)
        

    }

    @objc func test() {
        
        self.navigationController?.pushViewController(JMYInventoryViewController(), animated: true)
        
    }

    @objc
    func touchUpInsideMenuButton(_ sender: UIBarButtonItem) {
        
        let actionSheet = UIAlertController(title: "12345678901234567890123456789012345678901234567890", message: "12345678901234567890123456789012345678901234567890", preferredStyle: .actionSheet)
        
        let aa = UIAlertAction(title: "123456789012345678901234567890123456789012345678901234567890", style: .cancel, handler: nil)
        actionSheet.addAction(aa)
        let bb = UIAlertAction(title: "1234567890", style: .default, handler: nil)
        actionSheet.addAction(bb)
        let cc = UIAlertAction(title: "1234567890123456789012345678901234567890123456789012345", style: .destructive, handler: nil)
        actionSheet.addAction(cc)
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    @objc
    func touchUpInsideAddButton(_ sender: UIBarButtonItem) {
        
        let viewController = JMYLocationPopupViewController()
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .crossDissolve
        self.present(viewController, animated: true, completion: nil)
        
    }
}

extension JMYLocationListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: JMYLocationListCell.self), for: indexPath)
        
        return cell
        
    }
    
}

extension JMYLocationListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let viewController = UINavigationController(rootViewController: JMYInventoryViewController())
        self.present(viewController, animated: true, completion: nil)
        
    }
    
}

extension JMYLocationListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let fixedCoordinateSpaceWidth = UIScreen.main.fixedCoordinateSpace.bounds.size.width
        
        return CGSize(width: fixedCoordinateSpaceWidth, height: fixedCoordinateSpaceWidth - 40)
        
    }
    
}
