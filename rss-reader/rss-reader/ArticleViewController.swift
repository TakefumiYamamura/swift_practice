//
//  ViewController.swift
//  rss-reader
//
//  Created by TakefumiYamamura on 9/19/15.
//  Copyright (c) 2015 山村　武史. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var headerView: UIView!

    @IBOutlet weak var sitesScrollView: UIScrollView!
    var tabButtons:Array<UIButton> = []
    let wired = "WIRED"
    let shiki = "100SHIKI"
    let cinra = "CINRA.NET"
    
    let wiredImageName = "wired_top_image.png"
    let shikiImageName = "100shiki_top_image.png"
    let cinraImageName = "cinra_top_image.png"
    
    let blue = UIColor(red: 92.0 / 255, green: 192.0 / 255, blue: 210.0 / 255, alpha: 1.0)
    let yellow = UIColor(red: 105.0 / 255, green: 207.0 / 255, blue: 153.0 / 255, alpha: 1.0)
    let red = UIColor(red: 195.0 / 255, green: 123.0 / 255, blue: 175.0 / 255, alpha: 1.0)
    let black = UIColor(red: 50.0 / 255, green: 56.0 / 255, blue: 60.0 / 255, alpha: 1.0)
    
    let wiredURL = "http://wired.jp/rssfeeder/"
    let shikiURL =  "http://www.100shiki.com/feed"
    let cinraURL =   "http://www.cinra.net/rss-all.xml"

    override func viewDidLoad() {
        super.viewDidLoad()
        sitesScrollView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        self.sitesScrollView.contentSize = CGSizeMake(self.view.frame.width * 3, self.sitesScrollView.frame.height)
        self.sitesScrollView.pagingEnabled = true
        setArticleTableView(0, siteName: wired, siteImageName: wiredImageName, color: blue, siteURL: wiredURL)
        setArticleTableView(self.view.frame.width, siteName: shiki, siteImageName: shikiImageName, color: red, siteURL: shikiURL)
        setArticleTableView(self.view.frame.width*2, siteName: cinra, siteImageName: cinraImageName, color: yellow, siteURL: cinraURL)
        setTabButton(self.view.center.x/2, text: "W", color: blue, tag: 1)
        setTabButton(self.view.center.x, text: "100", color: red, tag: 2)
        setTabButton(self.view.center.x*3/2, text: "C", color: yellow, tag: 3)
        self.performSegueWithIdentifier("ShowToArticleWebViewController", sender: nil)
    }
    
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.width //ページは0,2,3になる
        for (var i = 0; i < 3; i++) {
            if page == CGFloat(i) {
                setSelectedButton(tabButtons[i], selected: true)
            } else {
                setSelectedButton(tabButtons[i], selected: false)
            }
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        //観覧中のページを取得(WIRED:page　== 0, 100SHKI: page == 1, CINRA: page == 2)
        let page = scrollView.contentOffset.x / scrollView.frame.width
        
        if page == 0 {
            setSelectedButton(tabButtons[0], selected: true)
            setSelectedButton(tabButtons[1], selected: false)
            setSelectedButton(tabButtons[2], selected: false)
        } else if page == 1 {
            setSelectedButton(tabButtons[0], selected: false)
            setSelectedButton(tabButtons[1], selected: true)
            setSelectedButton(tabButtons[2], selected: false)
        } else if page == 2 {
            setSelectedButton(tabButtons[0], selected: false)
            setSelectedButton(tabButtons[1], selected: false)
            setSelectedButton(tabButtons[2], selected: true)
        }
    }
    
    func setSelectedButton(button: UIButton, selected: Bool) {
        button.selected = selected
        button.layer.borderColor = button.titleLabel?.textColor.CGColor
    }
    
    
    func setArticleTableView(x: CGFloat, siteName: String, siteImageName: String, color: UIColor, siteURL: String){
        let frame = CGRectMake(x, 0, self.view.frame.width, sitesScrollView.frame.height)
        let articleTableView = ArticleTableView(frame: frame)
        articleTableView.loadRSS(siteURL)
        articleTableView.siteName = siteName
        articleTableView.siteImageName = siteImageName
        articleTableView.color = color
        sitesScrollView.addSubview(articleTableView)
    }
    
    func setTabButton(x: CGFloat, text: String, color: UIColor, tag: Int){
        var tabButton = UIButton()
        tabButton.frame.size = CGSizeMake(36, 36)
        tabButton.center = CGPointMake(x, 44)
        tabButton.setTitle(text, forState: UIControlState.Normal)
        tabButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        tabButton.setTitleColor(color, forState: UIControlState.Selected)
        tabButton.titleLabel?.font = UIFont(name: "HirakakuProN-W6", size: 13)
        tabButton.backgroundColor = black
        tabButton.tag = tag
        tabButton.addTarget(self, action: "tapTabButton:", forControlEvents: UIControlEvents.TouchUpInside)
        tabButton.layer.cornerRadius = 18
        tabButton.layer.borderColor = UIColor.whiteColor().CGColor
        tabButton.layer.borderWidth = 1
        tabButton.layer.masksToBounds = true
        self.headerView.addSubview(tabButton)
        tabButtons.append(tabButton)
    }
    
    func tapTabButton(sender: UIButton){
        var pointX = self.view.frame.width * CGFloat(sender.tag - 1)
        sitesScrollView.setContentOffset(CGPointMake(pointX, 0), animated: true)
    }
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

