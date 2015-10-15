//
//  NewTweetViewController.swift
//  mumutweet
//
//  Created by TakefumiYamamura on 2015/10/15.
//  Copyright (c) 2015年 山村　武史. All rights reserved.
//

import UIKit

class NewTweetViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    @IBOutlet weak var tweetField: UITextView!
    let tweetsCollection = TweetsCollection.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetField.layer.cornerRadius = 0.5
        tweetField.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        tweetField.layer.borderWidth = 1
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "tapGesture:")
        self.view.addGestureRecognizer(tapRecognizer)
        urlField.delegate = self
        tweetField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func tapGesture(sender: UITapGestureRecognizer){
        urlField.resignFirstResponder()
        tweetField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        urlField.resignFirstResponder()
        return true
    }
    
//    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
//        tweetField.resignFirstResponder()
//        return true
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBar.tintColor = UIColor.blackColor()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "閉じる", style: UIBarButtonItemStyle.Plain, target: self, action: "close")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style: UIBarButtonItemStyle.Plain, target: self, action: "save")
    }
    
    func close(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func save(){
        if tweetField.text.isEmpty{
            let alert = UIAlertController(title: "エラー", message: "ツイートしな！", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }else{
            let tweet = Tweet()
            tweet.text = tweetField.text
            tweet.image_url = urlField.text
            tweet.priority = Priority(rawValue: prioritySegment.selectedSegmentIndex)!
            self.tweetsCollection.addTweetsCollection(tweet)
            println(self.tweetsCollection.tweets)
            self.dismissViewControllerAnimated(true, completion: nil)
        }

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
