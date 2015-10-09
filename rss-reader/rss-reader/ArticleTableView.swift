//
//  ArticleTableView.swift
//  
//
//  Created by TakefumiYamamura on 2015/09/25.
//
//

import UIKit

class ArticleTableView: UITableView, UITableViewDelegate, UITableViewDataSource, NSXMLParserDelegate {
    
    
    
//    let blue = UIColor(red: 92.0 / 255, green: 192.0 / 255, blue: 210.0 / 255, alpha: 1.0)
    var siteName: String!
    var siteImageName: String!
    var color: UIColor!
    
    var elementName = ""
    var articles:Array<Article> = []
    
    //ソースコードでインスタンスを生成時に初期化
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.delegate = self
        self.dataSource = self
        
        self.registerNib(UINib(nibName: "SiteTopTableViewCell", bundle: nil), forCellReuseIdentifier: "SiteTopTableViewCell")
        self.registerNib(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    //Interface Builderでインスタンス生成時に初期化
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect, style: UITableViewStyle){
        super.init(frame: frame, style: style)
    }
    
    //セル数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return self.articles.count
        }
    }
    
    //セル内容
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("SiteTopTableViewCell", forIndexPath: indexPath) as! SiteTopTableViewCell
            cell.siteImageView.image = UIImage(named: self.siteImageName)
            cell.siteName.text = self.siteName
            cell.imageMaskView.backgroundColor = self.color
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("ArticleTableViewCell", forIndexPath: indexPath) as! ArticleTableViewCell
            let article = self.articles[indexPath.row]
            cell.title.text = article.title
            cell.descript.text = article.descript
            cell.date.text = conversionDateFormat(article.date)
            return cell
        }
    }
    
    //セルの高さ
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        } else {
            return 85
        }
    }
    
    func loadRSS(siteURL: String) {
        if let url = NSURL(string: siteURL){
            let request = NSURLRequest(URL: url)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithRequest(request, completionHandler: {
                (data, response, error) -> Void in
                let parser = NSXMLParser(data: data)
                parser.delegate = self
                parser.parse()
            })
            task.resume()
        }
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        self.elementName = elementName
        if self.elementName == "item" {
            let article = Article()
            self.articles.append(article)
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String?) {
        var lastArticle = self.articles.last
        if self.elementName == "title" {
            lastArticle?.title += string!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        } else if self.elementName == "description" {
            lastArticle?.descript += string!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        } else if self.elementName == "pubDate" {
            lastArticle?.date += string!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        } else if self.elementName == "link" {
            lastArticle?.link += string!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        }
    }
    
    func parserDidEndDocument(parser: NSXMLParser) {
        dispatch_async(dispatch_get_main_queue(), {
            self.reloadData()
        })
    }
    
    func conversionDateFormat(dateString:String) -> String {
        let inputFormatter = NSDateFormatter()
        inputFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss Z"
        let date: NSDate! = inputFormatter.dateFromString(dateString)
        let outputFormatter = NSDateFormatter()
        outputFormatter.dateFormat = "yyy/MM/dd HH:mm"
        let outputDateString = outputFormatter.stringFromDate(date)
        return outputDateString
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
