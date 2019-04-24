//
//  Quotes_TableViewCell.swift
//  Fitness
//
//  Created by Raja Vikram singh on 09/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit

class Quotes_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var view_Quotes:UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        view_Quotes.layer.cornerRadius = 4
        view_Quotes.layer.borderWidth = 1
        view_Quotes.layer.borderColor = UIColor .lightGray.cgColor
        view_Quotes.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
