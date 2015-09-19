//
//  ToDo.swift
//  ToDo-App
//
//  Created by TakefumiYamamura on 7/20/15.
//  Copyright (c) 2015 山村　武史. All rights reserved.
//

import UIKit

enum TodoPriority:Int {
    case Low = 0
    case Middle = 1
    case High = 2
}

class Todo: NSObject {
    var title = ""
    var descript = ""
    var priority:TodoPriority = .Low
}
