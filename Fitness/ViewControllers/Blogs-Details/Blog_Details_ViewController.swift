//
//  Blog_Details_ViewController.swift
//  Fitness
//
//  Created by Raja Vikram singh on 09/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit

class Blog_Details_ViewController: UIViewController {

    var imageForBlog = String()
    var tips = String()
    var time = String()
    var titile = String()
    var details = NSAttributedString()
    
    @IBOutlet weak var navBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
//selectedBlogIndex
        imageForBlog = modelBlogs.refrence.post_image[selectedBlogIndex]
        tips = modelBlogs.refrence.tag_title[selectedBlogIndex]
        time = modelBlogs.refrence.post_date[selectedBlogIndex]
        titile = modelBlogs.refrence.post_title[selectedBlogIndex]
        details = modelBlogs.refrence.post_description[selectedBlogIndex].html2AttributedString!
        
        navBar.topItem?.title = modelBlogs.refrence.post_title[selectedBlogIndex]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
