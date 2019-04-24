//
//  Extension-Find-Workout-Plan.swift
//  Fitness
//
//  Created by Raja Vikram singh on 03/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import Foundation
import UIKit


extension Find_Workout_PlanViewController {
    
    func func_TextField_Border_Padding(to textfield: UITextField) {
        textfield.layer.cornerRadius =  4
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.layer.borderWidth = 1
        textfield.clipsToBounds = true
        
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20, height: textfield.frame.size.height))
        textfield.leftView = leftView
        textfield.leftViewMode = .always
        
        textfield.rightView = leftView
        textfield.rightViewMode = .always
    }

}
