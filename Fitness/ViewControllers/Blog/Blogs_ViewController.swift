//
//  Blogs_ViewController.swift
//  Fitness
//
//  Created by Raja Vikram singh on 09/08/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import UIKit

import SVProgressHUD
var selectedBlogIndex = Int()

class Blogs_ViewController: UIViewController {

    @IBOutlet weak var collTwo: UICollectionView!
    @IBOutlet weak var tableview: UITableView!
    var tagTitle = [String]()
    var Title = [String]()
    var Time = [String]()
    var imageData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        SVProgressHUD.show()
        getBlogs()
    }
    @IBAction func backk(_ sender: Any) {
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
