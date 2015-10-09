//
//  ViewController.swift
//  orange
//
//  Created by TakefumiYamamura on 2015/10/04.
//  Copyright (c) 2015年 山村　武史. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let button = UIButton(frame: CGRect(x: self.view.center.x/2, y: self.view.center.y/2, width: 100, height:50))
        button.setTitle("Start Modal", forState: UIControlState.Normal)
        button.titleColorForState(state: UIColor.redColor())
        self.view.addSubview(button)
        button.addTarget(self, action: "tapButton:", forControlEvents: UIControlEvents.TouchUpInside)
        button.backgroundColor = UIColor.redColor()
//        let label = UILabel(frame: CGRect(x: self.view.center.x/2, y: self.view.center.y/2, width: 100, height: 50))
//        label.text = "Modal"
//        label.textColor = UIColor.whiteColor()
//        self.view.addSubview(label)
//        label.text = "Modal"
//        label.textAlignment = center
//        label.textColor = "white"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapButton(){
        println("タップしました")
    }


}

