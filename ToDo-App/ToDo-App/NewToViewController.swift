//
//  NewToViewController.swift
//  ToDo-App
//
//  Created by TakefumiYamamura on 7/22/15.
//  Copyright (c) 2015 山村　武史. All rights reserved.
//

import UIKit

class NewToViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var todoField: UITextField!
    @IBOutlet weak var descriptionView: UITextView!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    var todo: Todo!
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionView.layer.cornerRadius = 3
        descriptionView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
        descriptionView.layer.borderWidth = 1
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "tapGesture:")
        self.view.addGestureRecognizer(tapRecognizer)
        todoField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "閉じる", style: UIBarButtonItemStyle.Plain, target: self, action: "close")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style: UIBarButtonItemStyle.Plain, target: self, action: "save")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func close() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func save() {
        if todoField.text.isEmpty {
            let alertView = UIAlertController(title: "エラー", message: "Todoが記述されていません", preferredStyle: UIAlertControllerStyle.Alert)
            alertView.addAction(UIAlertAction(title: "はい", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertView, animated: true, completion: nil)
        } else {
            let todo = Todo()
            todo.title = todoField.text
            todo.descript = descriptionView.text
            todo.priority = TodoPriority(rawValue: prioritySegment.selectedSegmentIndex)!
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func tapGesture(sender: UITapGestureRecognizer) {
        todoField.resignFirstResponder()
        descriptionView.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        todoField.resignFirstResponder()
        return true
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
