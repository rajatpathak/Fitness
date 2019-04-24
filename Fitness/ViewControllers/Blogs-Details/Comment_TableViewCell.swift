//
//  Comment_TableViewCell.swift
//  Fitness
//
//  Created by Raja Vikram singh on 09/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit

class Comment_TableViewCell: UITableViewCell {

    @IBOutlet weak var imageForBlog: UIImageView!
    
    @IBOutlet weak var tips: UILabel!
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var titile: UILabel!
    @IBOutlet weak var details: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
