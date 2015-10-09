//
//  SiteTopTableViewCell.swift
//  rss-reader
//
//  Created by TakefumiYamamura on 2015/09/26.
//  Copyright (c) 2015年 山村　武史. All rights reserved.
//

import UIKit

class SiteTopTableViewCell: UITableViewCell {
    @IBOutlet weak var siteImageView: UIImageView!
    @IBOutlet weak var imageMaskView: UIView!
    @IBOutlet weak var siteName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setSiteImageView()
        setImageMaskView()
        setNameLabel()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setSiteImageView(){
        self.siteImageView.contentMode = UIViewContentMode.ScaleAspectFill
        self.siteImageView.layer.masksToBounds = true
    }
    
    //imageMaskViewの装飾
    func setImageMaskView(){
        self.imageMaskView.alpha = 0.6
    }
    
    //nameLabelの装飾
    func setNameLabel(){
        self.siteName.textColor = UIColor.whiteColor()
        self.siteName.textAlignment = NSTextAlignment.Center
        self.siteName.font = UIFont(name: "Helvetica-Light", size: 40)
    }
}
