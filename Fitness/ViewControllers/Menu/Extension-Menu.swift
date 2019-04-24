//
//  Extension-Menu.swift
//  Fitness
//
//  Created by Raja Vikram singh on 02/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import Foundation
import UIKit


extension Menu_ViewController :UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        } else {
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_MenuTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell_Black = tableView.dequeueReusableCell(withIdentifier: "cell_Black", for:indexPath)
            
            return cell_Black
        } else {
            let cell_Menu = tableView.dequeueReusableCell(withIdentifier: "cell_Menu", for:indexPath) as! Menu_TableViewCell
            
            cell_Menu.lbl_HomeTitle.text = arr_MenuTitle[indexPath.row]
            
            return cell_Menu
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let exersize_VC = self.storyboard?.instantiateViewController(withIdentifier: "Exersize_ViewController")
        self.navigationController?.pushViewController(exersize_VC!, animated: true)
    }
    
}
