//
//  NavigationViewController.swift
//  delegate_practice
//
//  Created by TakefumiYamamura on 2015/10/09.
//  Copyright (c) 2015年 山村　武史. All rights reserved.
//

import UIKit

class NavigationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        var btn = UIButton()
        btn.setTitle("画面遷移するお", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btn.center = view.center
        btn.sizeToFit()
        btn.addTarget(self, action: "move", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(btn)
        
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBar.barTintColor = UIColor.yellowColor()
        self.title = "最初の画面"
        self.navigationController!.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 20)!]
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        //なんで個々に定義？
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.Plain, target: self, action: "toNextViewController")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "次へ", style: UIBarButtonItemStyle.Plain, target: self, action: "move")
        

    }
    
    func move(){
        self.performSegueWithIdentifier("next", sender: self)
        // performSEgueWithIdentifer 第二引数
        
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
