//
//  RecordViewController.swift
//  OwaraiShindan
//
//  Created by Kumi on 2015/07/25.
//  Copyright (c) 2015年 Tekuru. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    var aD:AppDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        aD = UIApplication.sharedApplication().delegate as! AppDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //Table Viewのセルの数を指定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aD.records.count
    }
    
    //Table Viewのセルの数を指定
    // セルの値を設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        
        var nameLabel = cell.viewWithTag(1) as! UILabel
        nameLabel.text = aD.records[indexPath.row][0] as? String
        var genderLabel = cell.viewWithTag(2) as! UILabel
        genderLabel.text = aD.records[indexPath.row][1] as? String
        var scoreLabel = cell.viewWithTag(3) as! UILabel
        let score:Int = aD.records[indexPath.row][2] as! Int
        scoreLabel.text = "\(score*5)%"
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
