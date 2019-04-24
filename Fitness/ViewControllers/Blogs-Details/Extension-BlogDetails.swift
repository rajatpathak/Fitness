//
//  Extension-BlogDetails.swift
//  Fitness
//
//  Created by Raja Vikram singh on 09/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import Foundation
import UIKit


extension Blog_Details_ViewController :UITableViewDelegate,UITableViewDataSource,UITextViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 800
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell_Comments = tableView.dequeueReusableCell(withIdentifier: "Comment_TableViewCell", for:indexPath) as! Comment_TableViewCell
        cell_Comments.imageForBlog.downloadedFrom(link: imageForBlog)
        cell_Comments.tips.text = tips
        cell_Comments.time.text = time
        cell_Comments.titile.text = titile
        cell_Comments.details.attributedText = details

        return cell_Comments
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
 
    
}
