//
//  MTNNoteView.swift
//  NoteLearner
//
//  Created by Brian M Owen on 4/21/15.
//  Copyright (c) 2015 Brian Owen. All rights reserved.
//
//  This is class for assigning the note value to an image. C = 1, C# = 2 ..... B = 12

import UIKit

class NoteView : UIImageView{

    init(note: Int, noteString: String, noteImage: UIImage!) {
        self.noteName = note
        self.noteNameAsString = noteString
        super.init(image: noteImage)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let noteName : Int
    let noteNameAsString : String

}
