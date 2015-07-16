//
//  CustomCell.swift
//  6-5
//
//  Created by TakefumiYamamura on 7/16/15.
//  Copyright (c) 2015 山村　武史. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    @IBOutlet var image : UIImageView!
    
    override func awakeFromNib() {
        self.image.contentMode = UIViewContentMode.ScaleAspectFill
    }
}
