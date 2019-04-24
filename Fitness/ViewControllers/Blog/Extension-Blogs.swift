//
//  Extension-Blogs.swift
//  Fitness
//
//  Created by Raja Vikram singh on 09/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

extension Blogs_ViewController :UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 240
        }else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell_First = tableView.dequeueReusableCell(withIdentifier: "BlogFirst_TableViewCell", for:indexPath) as! BlogFirst_TableViewCell
            cell_First.coll_Cell_First.delegate = self
            cell_First.coll_Cell_First.dataSource = self
            cell_First.coll_Cell_First.tag = 1
            cell_First.coll_Cell_First.reloadData()
            
            return cell_First
        } else {
            let cell_RecentPosts = tableView.dequeueReusableCell(withIdentifier: "cell_RecentPosts", for:indexPath)
            
            return cell_RecentPosts
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}



extension Blogs_ViewController:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1 {
            return CGSize (width: collectionView.frame.size.width, height: 240)
        } else {
            return CGSize (width: collectionView.frame.size.width/2-10, height: 160)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Title.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
            let cell = collectionView .dequeueReusableCell(withReuseIdentifier: "cell_First_Blogs", for: indexPath) as! cell_First_Blogs
            cell.imageBlog.downloadedFrom(link: imageData[indexPath.row])
            cell.imageBlog.contentMode = .scaleAspectFill
            cell.title.text = Title[indexPath.row]
            cell.time.text = Time[indexPath.row]
            cell.tagTitle.text = tagTitle[indexPath.row]
            return cell
        } else {
            let cell_RecentPosts = collectionView .dequeueReusableCell(withReuseIdentifier: "cell_RecentPosts", for: indexPath) as! cell_RecentPosts
            cell_RecentPosts.backImage.contentMode = .scaleAspectFill
            cell_RecentPosts.backImage.downloadedFrom(link: imageData[indexPath.row])
            cell_RecentPosts.title.text = Title[indexPath.row]
            cell_RecentPosts.time.text = Time[indexPath.row]

            return cell_RecentPosts
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedBlogIndex = indexPath.row
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Blog_Details_ViewController") as! Blog_Details_ViewController
        self.present(vc, animated: true, completion: nil)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    
    func getBlogs(){
        
        modelBlogs.refrence.post_date = [String]()
        modelBlogs.refrence.post_description = [String]()
        modelBlogs.refrence.post_featured = [String]()
        modelBlogs.refrence.post_id = [String]()
        modelBlogs.refrence.post_image = [String]()
        modelBlogs.refrence.post_tag = [String]()
        modelBlogs.refrence.post_title = [String]()
        modelBlogs.refrence.published = [String]()
        modelBlogs.refrence.tag_title = [String]()
        modelBlogs.refrence.totalcomments = [String]()
        
        api_func.api_alamofire_get(url: API_BASE_URL+GET_BLOGS) { (response) in
            let jsonData : [String:Any] = convertToDictionary(text: response)!
            let data : NSArray = jsonData["posts"] as! NSArray
            for i in 0..<data.count{
                let dict : NSDictionary = data[i] as! NSDictionary
                
                modelBlogs.refrence.post_date.append("\(dict["post_date"]!)")
                modelBlogs.refrence.post_description.append("\(dict["post_description"]!)")
                modelBlogs.refrence.post_featured.append("\(dict["post_featured"]!)")
                modelBlogs.refrence.post_id.append("\(dict["post_id"]!)")
                modelBlogs.refrence.post_image.append(IMAGE_BASE_URL+"\(dict["post_image"]!)")
                modelBlogs.refrence.post_tag.append("\(dict["post_tag"]!)")
                modelBlogs.refrence.post_title.append("\(dict["post_title"]!)")
                modelBlogs.refrence.published.append("\(dict["published"]!)")
                modelBlogs.refrence.tag_title.append("\(dict["tag_title"]!)")
                modelBlogs.refrence.totalcomments.append("\(dict["totalcomments"]!)")
                self.tagTitle.append("\(dict["tag_title"]!)")
                self.Title.append("\(dict["post_title"]!)")
                self.Time.append("\(dict["post_date"]!)")
                self.imageData.append(IMAGE_BASE_URL+"\(dict["post_image"]!)")
            }
            self.tableview.reloadData()
            self.collTwo.reloadData()
            SVProgressHUD.dismiss()
        }
    }
    
}




