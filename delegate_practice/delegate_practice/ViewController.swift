//
//  ViewController.swift
//  delegate_practice
//
//  Created by TakefumiYamamura on 2015/10/04.
//  Copyright (c) 2015年 山村　武史. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ModalViewDelegate {
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let label = UILabel()
        label.text = "むむむ"
        label.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        label.center = CGPoint(x: self.view.frame.width/2, y:  self.view.frame.width/2 )
        label.textColor = UIColor.blackColor()
        label.font = UIFont.systemFontOfSize(15)
        label.textAlignment = NSTextAlignment.Center
        let btn = UIButton()
//        btn.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.width)
        btn.center = view.center
        btn.setTitle("おしてね", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btn.sizeToFit()
        btn.addTarget(self, action: "open_modal", forControlEvents: UIControlEvents.TouchUpInside)
        let segue_btn = UIButton()
//        segue_btn.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        segue_btn.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2 + 50)
        segue_btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        segue_btn.setTitle("画面遷移するお", forState: UIControlState.Normal)
        segue_btn.addTarget(self, action: "move_view", forControlEvents: UIControlEvents.TouchUpInside)
        segue_btn.sizeToFit()
        view.addSubview(label)
        view.addSubview(btn)
        view.addSubview(segue_btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func change_text(text: String) {
        label.text = text
    }
    
    func open_modal() {
        let modalView = ModalView(frame: view.bounds)
        modalView.customDelegate = self
        view.addSubview(modalView)
    }
    
    func move_view(){
        self.performSegueWithIdentifier("ModalSegue", sender: self)
    }
    
    @IBAction func toTop(segue: UIStoryboardSegue){
        
    }


}

