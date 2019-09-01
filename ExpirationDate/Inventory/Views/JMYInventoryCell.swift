//
//  JMYInventoryCell.swift
//  ExpirationDate
//
//  Created by JiminYoo on 26/08/2019.
//  Copyright © 2019 Jimin Yoo. All rights reserved.
//

import UIKit

class JMYInventoryCell: UITableViewCell {

    @IBOutlet private weak var imageContainerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageContainerView.layer.cornerRadius = 15.0
        imageContainerView.layer.borderWidth = 1 / UIScreen.main.scale
        imageContainerView.layer.borderColor = UIColor.gray.cgColor
        imageContainerView.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
