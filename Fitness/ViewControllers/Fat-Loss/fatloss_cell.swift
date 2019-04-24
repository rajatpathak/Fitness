//
//  fatloss_cell.swift
//  Fitness
//
//  Created by Love on 21/09/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit

class fatloss_cell: UITableViewCell {

    @IBOutlet weak var exc_Image: UIImageView!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var type: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
