//
//  Question2ViewController.swift
//  OwaraiShindan
//
//  Created by Kumi on 2015/07/25.
//  Copyright (c) 2015年 Tekuru. All rights reserved.
//

import UIKit

class Question2ViewController: UIViewController {

    @IBOutlet var q4: UISegmentedControl!
    @IBOutlet var q5: UISegmentedControl!
    @IBOutlet var q6: UISegmentedControl!
    @IBOutlet var q7: UISegmentedControl!
    @IBOutlet var q8: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ビューが遷移するタイミングで呼び出されるメソッド
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // AppDelegateから収集
        let aD: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        aD.score += q4.selectedSegmentIndex + q5.selectedSegmentIndex + q6.selectedSegmentIndex + q7.selectedSegmentIndex + q8.selectedSegmentIndex
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
