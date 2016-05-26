//
//  PostTableViewCell.swift
//  Healthy
//
//  Created by caiyueli on 16/5/25.
//  Copyright © 2016年 ard. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    
    
    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postDescLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
