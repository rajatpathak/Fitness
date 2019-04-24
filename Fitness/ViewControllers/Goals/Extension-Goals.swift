//
//  Extension-Goals.swift
//  Fitness
//
//  Created by Raja Vikram singh on 03/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SVProgressHUD
import FBSDKLoginKit

extension Goals_ViewController :UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 222
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell_Goals = tableView.dequeueReusableCell(withIdentifier: "cell_Goals", for:indexPath) as! cell_Goals
        cell_Goals.nameLabel.text = self.itemName[indexPath.row]
        cell_Goals.workoutImage.downloadedFrom(link: itemImage[indexPath.row], contentMode: .scaleToFill)
        
        return cell_Goals
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selected_Goal_Or_Level = self.itemID[indexPath.row]
        selected_Cell_title = self.itemName[indexPath.row]
//        Model_Goals.shared.str_Title = arr
        let fatLoss_VC = self.storyboard?.instantiateViewController(withIdentifier: "FatLoss_ViewController")
        self.navigationController?.pushViewController(fatLoss_VC!, animated: true)
    }
    
    func getGoalRequest(){
        itemImage.removeAll()
        itemName.removeAll()
        itemID.removeAll()
        var url = String()
        if goalOrLevel == "1"{
            url = API_BASE_URL+API_GOAL

        }
        else{
            url = API_BASE_URL+API_LEVEL
        }
        
        let Param : [String:Any] = ["":""]
        Alamofire.request(url, method: .get, parameters: Param).validate().responseString { (response) in            switch response.result{
            case .success:
                let resp : [String:Any] = convertToDictionary(text: response.result.value!)!
                let jsonDict : [String:Any] = resp
                print(jsonDict)
                let array : NSArray!
                if goalOrLevel == "1"{
                    array = jsonDict["goals"] as! NSArray
                    for i in 0..<array.count{
                        let dict : NSDictionary = array[i] as! NSDictionary
                        self.itemName.append("\(dict["goal_title"]!)")
                        self.itemImage.append("\(IMAGE_BASE_URL)\(dict["goal_image"]!)")
                        self.itemID.append("\(dict["goal_id"]!)")
                    }
                }
                else{
                    array = jsonDict["levels"] as! NSArray
                    for i in 0..<array.count{
                        let dict : NSDictionary = array[i] as! NSDictionary
                        self.itemName.append("\(dict["level_title"]!)")
                        self.itemImage.append("\(IMAGE_BASE_URL)\(dict["level_image"]!)")
                        self.itemID.append("\(dict["level_id"]!)")
                    }
                }
                
                self.tableView.reloadData()
                SVProgressHUD.dismiss()
                break
            case .failure:
                print("something went wrong")
                SVProgressHUD.dismiss()
                break
           
            }
            
        }
    }
    
}


