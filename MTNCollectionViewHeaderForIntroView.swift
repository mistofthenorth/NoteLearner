//
//  MTNCollectionViewHeaderForIntroView.swift
//  Band Note Learner
//
//  Created by Brian M Owen on 9/21/15.
//  Copyright © 2015 Brian Owen. All rights reserved.
//

import UIKit

class MTNCollectionViewHeaderForIntroView: UICollectionReusableView {
    
    //var textLabel: UILabel
    override init(frame: CGRect) {
        //self.textLabel = UILabel(frame: CGRectMake(0, 0, 100, 100))
        //self.textLabel.text = "New Notes for This Level"
        super.init(frame: frame)
        let textLabel = UILabel(frame: CGRectMake(0, 0, 100, 200))
        textLabel.text = "New Notes for This Level"
        textLabel.numberOfLines = 4
        self.addSubview(textLabel)
        self.backgroundColor = UIColor.grayColor()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
        
}
