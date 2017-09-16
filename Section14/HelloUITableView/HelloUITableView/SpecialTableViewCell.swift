//
//  SpecialTableViewCell.swift
//  HelloUITableView
//
//  Created by mikewang on 2017/9/16.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class SpecialTableViewCell: UITableViewCell {

    @IBOutlet weak var specialImageView: UIImageView!
    
    @IBOutlet weak var specialLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
