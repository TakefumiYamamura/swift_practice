//
//  TweetsCollection.swift
//  mumutweet
//
//  Created by TakefumiYamamura on 2015/10/14.
//  Copyright (c) 2015年 山村　武史. All rights reserved.
//

import UIKit

class TweetsCollection: NSObject {
    static let sharedInstance = TweetsCollection() 
    var tweets:[Tweet] = []
    
    func fetch_tweets() {
//        for i in 1...5 {
//            let tweet = Tweet()
//            tweet.text = "test\(i)"
//            self.tweets.append(tweet)
//        }
        for (var i = 0; i<7; i++){
            let tweet = Tweet()
            tweet.text = "test\(i)"
            self.tweets.append(tweet)
        }
    }
    
    func addTweetsCollection(tweet: Tweet){
        self.tweets.append(tweet)
    }
    
    func save(tweet:Tweet){
        
    }
    
    class func convertDictionary(tweet: Tweet)-> Dictionary<String, AnyObject>{
        var dic = Dictionary<String, AnyObject>()
        dic["text"] = tweet.text
        dic["image_url"] = tweet.image_url
        dic["priority"] = tweet.priority.rawValue
        return dic
    }
   
}
