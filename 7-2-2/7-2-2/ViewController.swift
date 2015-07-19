//
//  ViewController.swift
//  7-2-2
//
//  Created by TakefumiYamamura on 7/17/15.
//  Copyright (c) 2015 山村　武史. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(red: 0.0, green: 102.0 / 255, blue: 204.0 / 255, alpha: 1.0)
        let label = UILabel()
        label.text = "MainViewController"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "HiraKakuProN-W6", size: 20)
        label.sizeToFit()
        label.center = self.view.center
        
        self.view.addSubview(label)
        
        let button = UIButton()
        button.setTitle("start Modal", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.sizeToFit()
        button.center = CGPoint(x: self.view.center.x, y: label.frame.maxY + 30)
        button.addTarget(self, action: "didTouchButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didTouchButton(sender: UIButton) {
        self.performSegueWithIdentifier("ModalSegue", sender: self)
    }


}

