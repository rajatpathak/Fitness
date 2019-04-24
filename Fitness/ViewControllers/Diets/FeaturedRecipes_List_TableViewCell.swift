//
//  FeaturedRecipes_List_TableViewCell.swift
//  Fitness
//
//  Created by Raja Vikram singh on 09/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit

class FeaturedRecipes_List_TableViewCell: UITableViewCell {
    @IBOutlet weak var img_Diet:UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var calories: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        img_Diet.layer.cornerRadius = img_Diet.frame.size.height/2
        img_Diet.clipsToBounds = true
    }

}
