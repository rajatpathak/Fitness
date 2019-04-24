//
//  Extension-Day.swift
//  Fitness
//
//  Created by Raja Vikram singh on 03/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import Foundation
import UIKit


extension Day_ViewController :UITableViewDelegate,UITableViewDataSource {
    
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model_getDayWiseData.shared.level_title.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell_Day = tableView.dequeueReusableCell(withIdentifier: "cell_Day", for:indexPath) as! Day_TableViewCell
            
            cell_Day.lbl_HomeTitle.text = model_getDayWiseData.shared.exercise_title[indexPath.row]
            cell_Day.lbl_HomeContent.text = model_getDayWiseData.shared.level_title[indexPath.row]
            cell_Day.img_HomeIcons.downloadedFrom(link: model_getDayWiseData.shared.exercise_image[indexPath.row])
            
            return cell_Day
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selected_Day_Exercise = indexPath.row
        
//        Model_Day.shared.str_Title = arr_HomeTitle[indexPath.row]
        
        let exercise_VC = self.storyboard?.instantiateViewController(withIdentifier: "excerciseVC2") as! excerciseVC2
        self.present(exercise_VC, animated: true, completion: nil)
        
    }
    
    
}
