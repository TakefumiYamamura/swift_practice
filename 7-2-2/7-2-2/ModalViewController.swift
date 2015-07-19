//
//  ModalViewController.swift
//  7-2-2
//
//  Created by TakefumiYamamura on 7/17/15.
//  Copyright (c) 2015 山村　武史. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 1.0, green: 153.0 / 255, blue: 0.0, alpha: 1.0)
        let label = UILabel()
        label.text = "ModalViewController"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "HiraKakuProN-W6", size: 20)
        label.sizeToFit()
        label.center = self.view.center
        self.view.addSubview(label)
        
        let button = UIButton()
        button.setTitle("hide Modal", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.sizeToFit()
        button.center = CGPoint(x: self.view.center.x, y: label.frame.maxY + 60)
        button.addTarget(self, action: "didTouchButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didTouchButton(sender: UIButton) {
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
