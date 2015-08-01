//
//  ResultViewController.swift
//  OwaraiShindan
//
//  Created by Tekuru on 2015/07/25.
//  Copyright (c) 2015年 Tekuru. All rights reserved.
//

import UIKit
import Social

class ResultViewController: UIViewController, UIAlertViewDelegate {
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let aD: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var score :Int = aD.score * 5
        scoreLabel.text = "\(score)%"
        
        if score < 30 {
            messageLabel.text = "プランクトン級！"
        } else if score < 50 {
            messageLabel.text = "カブトムシ級！"
        } else if score < 70 {
            messageLabel.text = "サラリーマン級！"
        } else if score < 90 {
            messageLabel.text = "お笑い芸人級！"
        } else if score < 110 {
            messageLabel.text = "お笑い魔人級級！"
        } else {
            messageLabel.text = "お笑いで世界征服ができる級！"
        }
        
        // 動画にはないが、もしテキストフィールドに名前が入力されていなかった場合は
        // 「あなた」を適用するように記述する
        if aD.name.isEmpty {
            aD.name = "あなた"
        }
        nameLabel.text = "\(aD.name)は"
        genderLabel.text = "面白い" + aD.gender + "だ！"
        aD.records.append([aD.name, aD.gender, aD.score])
        
        aD.score = 0
        self.scoreLabel.hidden = true
        
    }
    
    @IBAction func twitter(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            // twitter利用可能
            var controller = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            let link:String = "http://google.co.jp"
            let url = NSURL(string: link)
            controller.addURL(url)
            let text:String = "お笑い診断！"
            controller.setInitialText(text)
            presentViewController(controller, animated: true, completion: nil)
        } else {
            var title:String = "お知らせ"
            var message:String = "twiiterアプリがインストールされていません"
            if objc_getClass("UIAlertController") != nil {
                //UIAlertController使用
                var ac = UIAlertController(title: title, message: message , preferredStyle: .Alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
                        println("OK button tapped.")
                    }
                    ac.addAction(okAction)
                    
                    presentViewController(ac, animated: true, completion: nil)
                
            } else {
                //UIAlertView使用
                var av = UIAlertView(title:title, message:message, delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "OK")
                av.show()
            }
            
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        scoreLabel.center = CGPointMake(scoreLabel.center.x, scoreLabel.center.y - 200)
        self.scoreLabel.hidden = false
        UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.scoreLabel.center = CGPointMake(self.scoreLabel.center.x, self.scoreLabel.center.y + 200)
            }, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
