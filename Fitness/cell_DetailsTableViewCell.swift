//
//  cell_DetailsTableViewCell.swift
//  Fitness
//
//  Created by Love on 23/09/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit

class cell_DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var goalName: UILabel!
    @IBOutlet weak var levelName: UILabel!
    @IBOutlet weak var titlee: UILabel!
    @IBOutlet weak var workoutImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
