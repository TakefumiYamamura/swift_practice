//
//  ViewController.swift
//  6-4
//
//  Created by TakefumiYamamura on 2015/06/22.
//  Copyright (c) 2015年 山村　武史. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UIScrollViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerScrollView: UIScrollView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    let backTweetView = UIView()
    let textField = UITextField()
    let textView = UITextView()
    var tweetArray: Array<Dictionary<String, String>> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        headerScrollView.delegate = self
        headerScrollView.contentSize = CGSize(width: self.view.frame.width*2, height: headerScrollView.frame.height)
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource  = self
        self.tableView.estimatedRowHeight = 78
        tableView.rowHeight = UITableViewAutomaticDimension
        setProfileImageView()
        let profileLabel = makeProfileLabel()
        headerScrollView.pagingEnabled = true
        headerScrollView.addSubview(profileLabel)
    }
    func makeProfileLabel() -> UILabel {
        let profileLabel = UILabel()
        profileLabel.frame.size = CGSizeMake(200, 100)
        profileLabel.center.x = self.view.frame.width*3/2
        profileLabel.center.y = headerScrollView.center.y-64
        profileLabel.text = "🍄だよ。好きなきのこはしめじで、嫌いなきのこはアミウダケです。よろしくね。"
        profileLabel.font = UIFont(name: "HirakakuProN-W6", size: 13)
        profileLabel.textColor = UIColor.whiteColor()
        profileLabel.textAlignment = NSTextAlignment.Center
        profileLabel.numberOfLines = 0
        return profileLabel
    }
    func setProfileImageView() {
        profileImageView.layer.cornerRadius = 5
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.borderColor = UIColor.whiteColor().CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        headerScrollView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: headerScrollView.contentOffset.x * 0.6 / self.view.frame.width)
        println("contentOffset: \(headerScrollView.contentOffset)")
    }
    
    //tableviewの処理
    
//    //ボタンがタップされた時の処理
//    @IBAction func tapTweetBtn(sender: AnyObject) {
//        let backTweetView = makeBackTweetView()
//        self.view.addSubview(backTweetView)
//        
//    }
//    //部品の生成のための処理
//    
//    //backTweetViewを生成してサイズ
//    func makeBackTweetView() -> UIView {
//        let backTweetView = UIView()
//        backTweetView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
//        backTweetView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
//        return backTweetView
//        
//    }
    //-------------ボタンがタップされた時の処理---------
    @IBAction func tapTweetBtn(sender: UIButton) {
        let backTweetView = makeBackTweetView()
        self.view.addSubview(backTweetView)
        
        let tweetView = makeTweetView()
        backTweetView.addSubview(tweetView)
        
        let textField = makeTextField()
        tweetView.addSubview(textField)
        
        let textView = makeTextView()
        tweetView.addSubview(textView)
        
        let nameLabel = makeLabel("名前", y: 5)
        tweetView.addSubview(nameLabel)
        
        let tweetLabel = makeLabel("ツイート内容", y: 85)
        tweetView.addSubview(tweetLabel)
        
        let cancelBtn = makeCancelBtn(tweetView)
        tweetView.addSubview(cancelBtn)
        
        let submitBtn = makeSubmitBtn()
        tweetView.addSubview(submitBtn)
        
    }
    
    func tappedSubmitBtn(sender: AnyObject){
        
        if (textField.text.isEmpty) || (textView.text.isEmpty){
            var alertController = UIAlertController(title: "Error", message: "'name' or 'text' is empty", preferredStyle: UIAlertControllerStyle.Alert)
            var action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alertController.addAction(action)
            presentViewController(alertController, animated: true, completion: nil)
        } else {
        var name = textField.text
        var tweet = textView.text
        println("名前:\(name)、ツイート内容:\(tweet)")
        
        var tweetDic: Dictionary<String, String> = [:]
        tweetDic["name"] = textField.text
        tweetDic["text"] = textView.text
        tweetDic["time"] = getCurrentTime()
//        tweetArray.append(tweetDic)
        tweetArray.insert(tweetDic, atIndex: 0)
        
        backTweetView.removeFromSuperview()
        textField.text = ""
        textView.text = ""
        tableView.reloadData()
        }
    }
    
    //現在時刻を取得
    func getCurrentTime() -> String {
        var now = NSDate() // 現在日時の取得
        var dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .ShortStyle
        dateFormatter.dateStyle = .ShortStyle
        var currentTime = dateFormatter.stringFromDate(now)
        return currentTime
    }
    
    
    //-------------部品の生成のための処理--------------
    func makeBackTweetView() -> UIView {
        
        backTweetView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        backTweetView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        return backTweetView
    }
    
    func makeTweetView() -> UIView {
        let tweetView = UIView()
        tweetView.frame.size = CGSizeMake(300, 300)
        tweetView.center.x = self.view.center.x
        tweetView.center.y = 250
        tweetView.backgroundColor = UIColor.whiteColor()
        tweetView.layer.shadowOpacity = 0.3
        tweetView.layer.cornerRadius = 3
        return tweetView
    }
    
    func makeTextField() -> UITextField{
        textField.frame = CGRectMake(10, 40, 280, 40)
        textField.font = UIFont(name: "HiraKakuProN-W6", size: 15)
        textField.borderStyle = UITextBorderStyle.RoundedRect
        return textField
    }
    func makeTextView() -> UITextView {
        textView.frame = CGRectMake(10, 120, 280,110)
        textView.font = UIFont(name: "HiraKakuProN-W6", size: 15)
        textView.layer.cornerRadius = 8
        textView.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0).CGColor
        textView.layer.borderWidth = 1
        return textView
    }
    func makeLabel(text: String, y: CGFloat) -> UILabel {
        var label = UILabel(frame: CGRectMake(10, y, 280, 40))
        label.text = text
        label.font = UIFont(name: "HiraKakuProN-W6", size: 15)
        return label
    }
    
    func makeCancelBtn(tweetView: UIView) -> UIButton {
        let cancelBtn = UIButton()
        cancelBtn.frame.size = CGSizeMake(20, 20)
        cancelBtn.center.x = tweetView.frame.width-15
        cancelBtn.center.y = 15
        cancelBtn.setBackgroundImage(UIImage(named: "cancel.png"), forState: .Normal)
        cancelBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        cancelBtn.backgroundColor = UIColor(red: 0.14, green: 0.3, blue: 0.68, alpha: 1.0)
        cancelBtn.layer.cornerRadius = cancelBtn.frame.width/2
        return cancelBtn
    }
    
    func makeSubmitBtn() -> UIButton {
        let submitBtn = UIButton()
        submitBtn.frame = CGRectMake(10, 250, 280, 40)
        submitBtn.setTitle("送信", forState: .Normal)
        submitBtn.titleLabel?.font = UIFont(name: "HiraKakuProN-W6", size: 15)
        submitBtn.backgroundColor = UIColor(red: 0.14, green: 0.3, blue: 0.68, alpha: 1.0)
        submitBtn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        submitBtn.layer.cornerRadius = 7
        submitBtn.addTarget(self, action: "tappedSubmitBtn:", forControlEvents:.TouchUpInside)
        return submitBtn
    }
    
    //-------------TableViewの処理------------------
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("myCell") as! UITableViewCell
        var tweet = tweetArray[indexPath.row]
        
        var nameLabel = cell.viewWithTag(1) as! UILabel
        nameLabel.text = tweet["name"]
        nameLabel.font = UIFont(name: "HirakakuProN-W6", size: 13)
        
        var textLabel = cell.viewWithTag(2) as! UILabel
        textLabel.text = tweet["text"]
        textLabel.font = UIFont(name: "HirakakuProN-W6", size: 18)
        textLabel.numberOfLines = 0
        
        var timeLabel = cell.viewWithTag(3) as! UILabel
        timeLabel.text = tweet["time"]
        timeLabel.font = UIFont(name: "HirakakuProN-W3", size: 10)
        timeLabel.textColor = UIColor.grayColor()
        
        var myImageView = cell.viewWithTag(4) as! UIImageView
        myImageView.image = UIImage(named: "pug")
        myImageView.layer.cornerRadius = 3
        myImageView.layer.masksToBounds = true
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetArray.count
    }
    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "myCell")
//        return cell
//    }


}

