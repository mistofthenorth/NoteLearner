//
//  MTNLevel.swift
//  NoteLearner
//
//  Created by Brian M Owen on 4/6/15.
//  Copyright (c) 2015 Brian Owen. All rights reserved.
//

import UIKit

class Level{

    let whichLevel : Int?
    let whichInstrument : String?
    var instrumentType : Instrument? = nil
    
    init(levelNumber: Int, instrument: String)
    {
        self.whichLevel = levelNumber
        self.whichInstrument = instrument
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