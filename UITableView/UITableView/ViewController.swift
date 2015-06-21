//
//  ViewController.swift
//  UITableView
//
//  Created by TakefumiYamamura on 2015/06/22.
//  Copyright (c) 2015年 山村　武史. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var myTableView: UITableView!
    
    //1.画像の名前を入れた配列を定義
    var dogImageArray = ["Pug", "Chihuahua","Miniature Dachshund", "Maltese", "Corgi"]
    var catImageArray = ["American Shorthair", "Munchkin", "Persian", "Russian Blue", "Mikeneko"]
    var sectionTitle = ["Dog", "Cat"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    //行数の指定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowNumber: Int
        if section == 0 {
            rowNumber = dogImageArray.count  //4 (dogImageArray配列の要素数)
        } else {
            rowNumber = catImageArray.count  //5 (catImageArray配列の要素数)
        }
        return rowNumber
    }
    
    //セクションの数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    //セルの内容
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "myCell")
        cell.textLabel?.text = sectionTitle[indexPath.section]
                cell.detailTextLabel?.text = "Row：\(indexPath.row)"
        if indexPath.section == 0 {
            cell.detailTextLabel?.text = "This dog is a \(dogImageArray[indexPath.row])"
            cell.imageView?.image = UIImage(named: "\(dogImageArray[indexPath.row]).png")
        } else {
            cell.detailTextLabel?.text = "This cat is a \(catImageArray[indexPath.row])"
            cell.imageView?.image = UIImage(named: "\(catImageArray[indexPath.row]).png")
        }
        return cell
    }
    
    //セルの高さ
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(60)
    }
    
    //セクションのタイトル
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = "Section:\(section)"
        return sectionTitle[section]
    }
    
    //セクションのタイトルの高さ
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(44)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

