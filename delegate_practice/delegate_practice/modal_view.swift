//
//  modal_view.swift
//  delegate_practice
//
//  Created by TakefumiYamamura on 2015/10/04.
//  Copyright (c) 2015年 山村　武史. All rights reserved.
//

import UIKit

@objc protocol ModalViewDelegate{
    func change_text(text: String)
}

class ModalView: UIView, UITextFieldDelegate {
    let textField = UITextField()
    weak var customDelegate: ModalViewDelegate?

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let backgroundView = UIView(frame: bounds)
        backgroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        let modal = UIView()
        modal.frame.size = CGSize(width: 250, height: 200)
        modal.center = CGPoint(x: center.x, y: center.y - 20)
        modal.backgroundColor = UIColor.whiteColor()
        textField.backgroundColor = UIColor(red: 250, green: 0, blue: 0, alpha: 0.5)
        textField.frame.size = CGSize(width: 230, height: 30)
        textField.frame.origin = CGPoint(x: 10, y: 10)
        textField.delegate = self
        let button = UIButton()
        button.setTitle("更新", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        button.frame.origin = CGPoint(x: 10, y: 100)
        button.frame.size = CGSize(width: 100, height: 50)
        button.addTarget(self, action: "close", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(backgroundView)
        self.addSubview(modal)
        modal.addSubview(textField)
        modal.addSubview(button)
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func close(){
        customDelegate?.change_text(textField.text)
        self.removeFromSuperview()
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
