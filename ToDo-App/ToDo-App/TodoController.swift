//
//  TodoController.swift
//  ToDo-App
//
//  Created by TakefumiYamamura on 7/20/15.
//  Copyright (c) 2015 山村　武史. All rights reserved.
//

import UIKit

class TodoController: NSObject {
    class func fetchTodos() -> Array<Todo> {
        var todos:[Todo] = []
        for (var i = 1; i < 8; i++) {
            var todo = Todo()
            todo.title = "Todo\(i)"
            todos.append(todo)
        }
        return todos
    }
}
