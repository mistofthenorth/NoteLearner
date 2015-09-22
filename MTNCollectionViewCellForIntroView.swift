//
//  MTNCollectionViewCellForIntroView.swift
//  Band Note Learner
//
//  Created by Brian M Owen on 9/17/15.
//  Copyright © 2015 Brian Owen. All rights reserved.
//

import UIKit

class MTNCollectionViewCellForIntroView: UICollectionViewCell {

    func printMessage() {
        print("This is from the custom class")
    }
    
    func addLabel(noteName: String){
        let textLocation = CGRectMake(contentView.frame.midX+18, contentView.frame.minY+20, 20, 20)
        let testLabel = UILabel(frame: textLocation)
        testLabel.text = noteName
        contentView.addSubview(testLabel)
    
    }
    

}
