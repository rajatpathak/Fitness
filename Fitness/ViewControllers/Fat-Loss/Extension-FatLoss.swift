//
//  Extension-FatLoss.swift
//  Fitness
//
//  Created by Raja Vikram singh on 03/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import Foundation
import UIKit


extension FatLoss_ViewController :UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 222
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.Set_title.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell_Goals = tableView.dequeueReusableCell(withIdentifier: "fatloss_cell", for:indexPath) as! fatloss_cell
        cell_Goals.exc_Image.downloadedFrom(link: exc_Image[indexPath.row])
        cell_Goals.topTitle.text = topTitle[indexPath.row]
        cell_Goals.title.text = Set_title[indexPath.row]
        cell_Goals.type.text = type[indexPath.row]
        
        
        
        return cell_Goals
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
       model_Helper_Details.refrence.did = self.did[indexPath.row]
       model_Helper_Details.refrence.goal_title = self.goal_title[indexPath.row]
       model_Helper_Details.refrence.id = self.id[indexPath.row]
       model_Helper_Details.refrence.level_title = self.level_title[indexPath.row]
       model_Helper_Details.refrence.workout_description = self.workout_description[indexPath.row]
       model_Helper_Details.refrence.workout_duration = self.workout_duration[indexPath.row]
       model_Helper_Details.refrence.workout_goal = self.workout_Goal[indexPath.row]
       model_Helper_Details.refrence.workout_id = self.workoutId[indexPath.row]
       model_Helper_Details.refrence.workout_image = self.workout_image[indexPath.row]
       model_Helper_Details.refrence.workout_level = self.workOut_Level[indexPath.row]
       model_Helper_Details.refrence.workout_title = self.workout_title[indexPath.row]

        
        let details_VC = self.storyboard?.instantiateViewController(withIdentifier: "Details_ViewController")
        self.navigationController?.pushViewController(details_VC!, animated: true)
    }
    
    
}
