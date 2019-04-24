//
//  EquipmentDetailTableViewCell.swift
//  Fitness
//
//  Created by Love on 18/09/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit

class EquipmentDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var EqipmentImgae: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
