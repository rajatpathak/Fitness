//
//  Home_TableViewCell.swift
//  Fitness
//
//  Created by Raja Vikram singh on 02/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit

class Home_TableViewCell: UITableViewCell {
    @IBOutlet weak var lbl_HomeTitle:UILabel!
    @IBOutlet weak var lbl_HomeContent:UILabel!

    @IBOutlet weak var img_HomeIcons:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
