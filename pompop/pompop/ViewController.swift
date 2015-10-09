//
//  ViewController.swift
//  pompop
//
//  Created by TakefumiYamamura on 2015/10/04.
//  Copyright (c) 2015年 山村　武史. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var blackview = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var btn = UIButton()
        blackview = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        blackview.backgroundColor = UIColor.blackColor()
        self.view.addSubview(blackview)
        btn.frame.size = CGSizeMake(100, 50)
        btn.center  = self.view.center
        btn.setTitle("むうむう", forState:UIControlState.Normal)
        btn.setTitleColor( UIColor.blueColor(), forState:UIControlState.Normal)
        self.view.addSubview(btn)
        btn.addTarget(self, action: "tap:",forControlEvents: UIControlEvents.TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tap(sender: UIButton){
        let powan = UIView(frame: CGRect(x: self.view.frame.width / 2 - 50, y: self.view.frame.height / 2 - 50, width: 100, height: 100))
        powan.layer.borderWidth = 2
        powan.layer.borderColor = UIColor.redColor().CGColor
        powan.layer.cornerRadius = powan.layer.frame.size.width/2
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "move:", userInfo: powan, repeats: true)
    }
    
    func move(sender: NSTimer)
    {
        let powan = sender.userInfo as! UIView
        powan.layer.frame.size.width += 10
        powan.layer.frame.size.height += 10
        powan.layer.frame.origin.x -= 5
        powan.layer.frame.origin.y -= 5
        powan.layer.cornerRadius = powan.layer.frame.size.width/2
        blackview.addSubview(powan)
    }

}

