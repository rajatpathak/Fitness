//
//  Extension-Home.swift
//  Fitness
//
//  Created by Raja Vikram singh on 02/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import Foundation
import UIKit


extension Home_ViewController :UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 200
        } else {
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_HomeIcons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell_Black = tableView.dequeueReusableCell(withIdentifier: "cell_Black", for:indexPath)
            
            return cell_Black
        } else {
            let cell_Home = tableView.dequeueReusableCell(withIdentifier: "cell_Home", for:indexPath) as! Home_TableViewCell
            
            cell_Home.lbl_HomeTitle.text = arr_HomeTitle[indexPath.row]
            cell_Home.lbl_HomeContent.text = arr_HomeContent[indexPath.row]
            cell_Home.img_HomeIcons.image = UIImage (named: arr_HomeIcons[indexPath.row])
            
            return cell_Home
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        Model_SideMenu.shared.str_Dismiss_Pop = "pop"
        
        Model_Home.shared.str_Title = arr_HomeTitle[indexPath.row]

        
        
        if indexPath.row == 1 {
            let working_VC = self.storyboard?.instantiateViewController(withIdentifier: "Workout_ViewController")
            self.navigationController?.pushViewController(working_VC!, animated: true)
        } else if indexPath.row == 2 {
            let bodyParts_VC = self.storyboard?.instantiateViewController(withIdentifier: "exercisesVC") as! exercisesVC
            self.present(bodyParts_VC, animated: true, completion: nil)
        }
        else if indexPath.row == 3 {
           
            let bodyParts_VC = self.storyboard?.instantiateViewController(withIdentifier: "Diets_ViewController") as! Diets_ViewController
            self.present(bodyParts_VC, animated: true, completion: nil)
        }
        else if indexPath.row == 4 {
           
            let bodyParts_VC = self.storyboard?.instantiateViewController(withIdentifier: "Blogs_ViewController") as! Blogs_ViewController
            self.present(bodyParts_VC, animated: true, completion: nil)
        }
        
        
    }
    
}
