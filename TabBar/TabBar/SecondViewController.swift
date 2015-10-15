//
//  SecondViewController.swift
//  TabBar
//
//  Created by TakefumiYamamura on 2015/10/10.
//  Copyright (c) 2015年 山村　武史. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 255, green: 213, blue: 0, alpha: 1.0)
        let label = UILabel()
        label.text = "second"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "Helvetica Bold 24.0", size: 15)
        label.center = view.center
        label.frame.size = CGSize(width: view.frame.width, height: 30)
        view.addSubview(label)

        // Do any additional setup after loading the view.
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
