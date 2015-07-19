//
//  ViewController.swift
//  NavigationController
//
//  Created by TakefumiYamamura on 7/19/15.
//  Copyright (c) 2015 山村　武史. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let deepGreen = UIColor(red: 72.0 / 255, green: 140.0 / 255, blue: 141.0 / 255, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = deepGreen
        self.title = "Main View Controller"
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.translucent = false
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.Plain, target: self, action: "toNextViewController")
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.whiteColor(),
                NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 20)!]
    }
    
    @IBAction func tapTransitionBtn(sender: UIButton) {
        self.performSegueWithIdentifier("NextSegue", sender: nil)
    }
    
    func toNextViewController() {
        self.performSegueWithIdentifier("NextSegue", sender: nil)
    }


}

