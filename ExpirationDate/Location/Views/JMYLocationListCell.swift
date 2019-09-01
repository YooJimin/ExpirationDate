//
//  JMYLocationListCell.swift
//  ExpirationDate
//
//  Created by JiminYoo on 05/08/2019.
//  Copyright © 2019 Jimin Yoo. All rights reserved.
//

import UIKit

class JMYLocationListCell: UICollectionViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet public weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // corner radius
        self.containerView.layer.cornerRadius = 30.0
        
        // shadow
        self.containerView.layer.shadowColor = UIColor.black.cgColor
        self.containerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.containerView.layer.shadowOpacity = 0.2
        self.containerView.layer.shadowRadius = 4.0
        
    }
    
}
