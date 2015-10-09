//
//  ViewController.swift
//  orange1
//
//  Created by TakefumiYamamura on 2015/10/04.
//  Copyright (c) 2015年 山村　武史. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x: self.view.center.x, y: self.view.center.y, width: 100, height: 50))
        label.text = "Modal"
        label.textColor = UIColor.whiteColor()
        self.view.addSubview(label)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

