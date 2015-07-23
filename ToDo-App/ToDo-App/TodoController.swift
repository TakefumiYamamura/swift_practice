//
//  TodoController.swift
//  ToDo-App
//
//  Created by TakefumiYamamura on 7/20/15.
//  Copyright (c) 2015 山村　武史. All rights reserved.
//

import UIKit

class TodoController: NSObject {
    class func fetchTodos() -> Array<ToDo> {
        var todos:[ToDo] = []
        for (var i = 1; i < 8; i++) {
            var todo = ToDo()
            todo.title = "Todo\(i)"
            todos.append(todo)
        }
        return todos
    }
}
