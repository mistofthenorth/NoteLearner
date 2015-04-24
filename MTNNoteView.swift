//
//  MTNNoteView.swift
//  NoteLearner
//
//  Created by Brian M Owen on 4/21/15.
//  Copyright (c) 2015 Brian Owen. All rights reserved.
//

import UIKit

class NoteView : UIImageView{

    init(note: Int, noteImage: UIImage!) {
        self.noteName = note
        super.init(image: noteImage)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let noteName : Int

}
