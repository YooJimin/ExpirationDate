//
//  JMYInventoryViewController.swift
//  FoodInventory
//
//  Created by JiminYoo on 09/06/2019.
//  Copyright © 2019 Jimin Yoo. All rights reserved.
//

import UIKit

class JMYInventoryViewController: JMYViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()
        self.setupViews()
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = "test"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(touchUpInsideCancelButton(_:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(touchUpInsideAddButton(_:)))
    }
    
    func setupViews() {
        self.tableView.register(UINib(nibName: String(describing: JMYInventoryCell.self), bundle: nil), forCellReuseIdentifier: String(describing: JMYInventoryCell.self))
        self.tableView.separatorInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
    }

    @objc
    func touchUpInsideCancelButton(_ barButtonItem: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc
    func touchUpInsideAddButton(_ barButtonItem: UIBarButtonItem) {
        let viewController = UINavigationController(rootViewController:  JMYItemViewController())
        self.present(viewController, animated: true, completion: nil)
    }
}

extension JMYInventoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: JMYInventoryCell.self), for: indexPath) as! JMYInventoryCell
        
        return cell
    }

}

extension JMYInventoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewController = JMYItemViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
}
