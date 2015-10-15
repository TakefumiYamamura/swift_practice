//
//  Tweet.swift
//  mumutweet
//
//  Created by TakefumiYamamura on 2015/10/14.
//  Copyright (c) 2015年 山村　武史. All rights reserved.
//

import UIKit

enum Priority: Int {
    case low = 0
    case middle = 1
    case high = 2
}

class Tweet: NSObject {
    var image_url = ""
    var text = ""
    var priority:Priority = .low
   
}
