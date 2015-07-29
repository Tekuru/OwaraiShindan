//
//  Question1ViewController.swift
//  OwaraiShindan
//
//  Created by Tekuru on 2015/07/25.
//  Copyright (c) 2015年 Tekuru. All rights reserved.
//

import UIKit

class Question1ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var name: UITextField!
    @IBOutlet var gender: UISegmentedControl!
    
    @IBOutlet var q1: UISegmentedControl!
    @IBOutlet var q2: UISegmentedControl!
    @IBOutlet var q3: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        name.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ビューが遷移するタイミングで呼び出されるメソッド
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // AppDelegateから収集
        let aD: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        aD.name = name.text
        switch gender.selectedSegmentIndex {
        case 0:
            aD.gender = "男"
        case 1:
            aD.gender = "女"
        case 2:
            aD.gender = "その他"
        default:
            break
        }

        aD.score = q1.selectedSegmentIndex + q2.selectedSegmentIndex + q3.selectedSegmentIndex
    }

// MARK:UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

// MARK:for StoryBoad

    // ストーリーボードの画面遷移(リトライ)でアクセスするためのメソッド
    @IBAction func goQuestion(segue: UIStoryboardSegue){
        
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
