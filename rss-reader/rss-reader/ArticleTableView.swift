//
//  ArticleTableView.swift
//  
//
//  Created by TakefumiYamamura on 2015/09/25.
//
//

import UIKit

class ArticleTableView: UITableView {
    
    //ソースコードでインスタンスを生成時に初期化
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //Interface Builderでインスタンス生成時に初期化
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
