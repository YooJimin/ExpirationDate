//
//  JMYLocationListViewController.swift
//  FoodInventory
//
//  Created by JiminYoo on 09/06/2019.
//  Copyright © 2019 Jimin Yoo. All rights reserved.
//

import UIKit

class JMYLocationListViewController: JMYViewController {

    var locationList: [Location]? {
        didSet {
            
            if let _ = self.locationList {
                
                self.collectionView.reloadData()
                
            }
            
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavigationBar()
        self.setupViews()
        self.loadData()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        self.perform(#selector(test), with: nil, afterDelay: 1.0)
        
    }
    
    func setupNavigationBar() {
        
        self.title = "test"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.bookmarks, target: self, action: #selector(touchUpInsideMenuButton(_:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(touchUpInsideAddButton(_:)))
        
    }
    
    func setupViews() {
        
        self.collectionView.register(UINib(nibName: String(describing: JMYLocationListCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: JMYLocationListCell.self))
        
    }
    
    func loadData() {
        
        self.locationList = DataBaseManager.shared.readLocationList()
        
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
        
        let viewController = JMYLocationPopupViewController { [weak self] in
            if let unwrappedSelf = self {
                unwrappedSelf.loadData()
            }
        }
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .crossDissolve
        self.present(viewController, animated: true, completion: nil)
        
    }
}

extension JMYLocationListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.locationList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: JMYLocationListCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: JMYLocationListCell.self), for: indexPath) as! JMYLocationListCell
        
        cell.nameLabel.text = self.locationList?[indexPath.item].name
        
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
