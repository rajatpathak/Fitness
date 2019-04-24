//
//  Equipment_TableViewCell.swift
//  Fitness
//
//  Created by Love on 18/09/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit

class Equipment_TableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
