//
//  Extension-Details.swift
//  Fitness
//
//  Created by Raja Vikram singh on 03/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import Foundation
import UIKit


extension Details_ViewController :UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 270
        } else {
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell_Black = tableView.dequeueReusableCell(withIdentifier: "cell_DetailsTableViewCell", for:indexPath) as! cell_DetailsTableViewCell
            cell_Black.goalName.text = goalName
            cell_Black.levelName.text = levelName
            cell_Black.titlee.text = titleOfCell
            cell_Black.workoutImage.downloadedFrom(link: IMAGE_BASE_URL+imagee)
            return cell_Black
        } else {
            let cell_Details_Title = tableView.dequeueReusableCell(withIdentifier: "cell_Details_Title", for:indexPath) as! Details_TableViewCell
            
            cell_Details_Title.lbl_DetailsTitle.text = "Day \(indexPath.row)"
            
            return cell_Details_Title
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0{
            
        }
        else{
            Model_Details.shared.str_Title = "Day \(indexPath.row)"
            model_Helper_Details.refrence.selectedDay = "\(indexPath.row)"
            
            let days_VC = self.storyboard?.instantiateViewController(withIdentifier: "Day_ViewController")
            self.navigationController?.pushViewController(days_VC!, animated: true)
        }
        
    }
    
    
}
