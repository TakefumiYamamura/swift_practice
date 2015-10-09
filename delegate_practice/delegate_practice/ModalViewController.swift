//
//  ModalViewController.swift
//  delegate_practice
//
//  Created by TakefumiYamamura on 2015/10/08.
//  Copyright (c) 2015年 山村　武史. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        let backbtn = UIButton()
        backbtn.setTitle("戻る", forState: UIControlState.Normal)
        backbtn.center = view.center
        backbtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        backbtn.sizeToFit()
        backbtn.addTarget(self, action: "returnTop:", forControlEvents: UIControlEvents.TouchUpInside)
//        backbtn.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(backbtn)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func returnTop(sender: UIButton){
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
        })
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
