//
//  ArticleWebViewController.swift
//  rss-reader
//
//  Created by TakefumiYamamura on 2015/10/02.
//  Copyright (c) 2015年 山村　武史. All rights reserved.
//

import UIKit
import WebKit

class ArticleWebViewController: UIViewController, WKNavigationDelegate {
    
    let black = UIColor(red: 50.0 / 255, green: 56.0 / 255, blue: 60.0 / 255, alpha: 1.0)
    let wkWebView = WKWebView()
    let siteURL = "http://www.cinra.net/news/20150502-nipponnomanngaanimegame"

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.performSegueWithIdentifier("ShowToArticleWebViewController", sender: nil)
        self.navigationController!.setNavigationBarHidden(false, animated: true)
        self.navigationController!.navigationBar.barTintColor = black
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        
        var URL = NSURL(string: siteURL)
        var URLReq = NSURLRequest(URL: URL!)
        
        self.wkWebView.navigationDelegate = self
        self.wkWebView.frame = self.view.frame
        self.wkWebView.loadRequest(URLReq)
        self.view.addSubview(wkWebView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.setNavigationBarHidden(true, animated: true)
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
