//
//  MTNLevel.swift
//  NoteLearner
//
//  Created by Brian M Owen on 4/6/15.
//  Copyright (c) 2015 Brian Owen. All rights reserved.
//

import UIKit

class GameManager{

    let whichLevel : Int?
    var instrumentType : Instrument? = nil
    
    init(levelNumber: Int, instrument: String)
    {
        self.whichLevel = levelNumber
        self.instrumentType = Instrument(inst: instrument, setLevel: 1)

    }
    
    func note() -> NoteView?{

            let noteChoices = self.instrumentType?.getNotes()
            println("The array has \(noteChoices?.count) notes")
            println(self.instrumentType?.level)
            let noteNumber = Int(arc4random_uniform(UInt32(noteChoices!.count)))
            println(noteChoices?[noteNumber].noteName)
            return noteChoices?[noteNumber]
    
    }
    
    
    
}