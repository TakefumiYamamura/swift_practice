//
//  ViewController.swift
//  practice_delegate
//
//  Created by TakefumiYamamura on 2015/10/04.
//  Copyright (c) 2015年 山村　武史. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Protocol {
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.custome_delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //ボタンが押された時にshowModalメソッドを実行
    @IBAction func myButton(sender: UIButton) {
        showModal()
    }
    
    //ModalViewを表示する
    func showModal() {
        let modalView = ModalView(frame: self.view.bounds)
        self.view.addSubview(modalView)
    }
}

