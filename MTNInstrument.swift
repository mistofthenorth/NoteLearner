//
//  MTNInstrument.swift
//  NoteLearner
//
//  Created by Brian M Owen on 4/9/15.
//  Copyright (c) 2015 Brian Owen. All rights reserved.
//

import UIKit

class Instrument {
    
    init(inst: String, setLevel: Int){
        if (inst == "Trumpet")
        {
            instrumentType = .Trumpet
        }
        else{
            instrumentType = .AltoSaxophone
        }
        
        level = setLevel
        
    }
    
    func getNotes() ->[NoteView]{
        var noteArray = [NoteView]()
        let noteList = NoteList.returnNoteList()
        
        switch instrumentType {
        case .Trumpet :
        println("It's a trumpet")
        if (level == 1){
            noteArray.append(noteList["C4t"]!)
            noteArray.append(noteList["D4t"]!)
            noteArray.append(noteList["E4t"]!)
            noteArray.append(noteList["F4t"]!)
            noteArray.append(noteList["G4t"]!)
            }
        if (level == 2){
            noteArray.append(noteList["C4t"]!)
            noteArray.append(noteList["D4t"]!)
            noteArray.append(noteList["E4t"]!)
            noteArray.append(noteList["F4t"]!)
            noteArray.append(noteList["G4t"]!)
            noteArray.append(noteList["A4t"]!)
            noteArray.append(noteList["B4t"]!)
            noteArray.append(noteList["C5t"]!)
            }
            
        case .AltoSaxophone :
        println("It's an alto sax")
        if (level == 1){
            noteArray.append(noteList["G4t"]!)
            noteArray.append(noteList["A4t"]!)
            noteArray.append(noteList["B4t"]!)
            noteArray.append(noteList["C5t"]!)
            noteArray.append(noteList["D5t"]!)
            }
        if (level == 2){
            noteArray.append(noteList["F#4t"]!)
            noteArray.append(noteList["G4t"]!)
            noteArray.append(noteList["A4t"]!)
            noteArray.append(noteList["B4t"]!)
            noteArray.append(noteList["C5t"]!)
            noteArray.append(noteList["D5t"]!)
            noteArray.append(noteList["E5t"]!)
            
            }
            
        default :
        println("No instrument selected")
        }
        
        return noteArray
    }
    
    var describe = "This is part of the Instrument Class"
    var instrumentType: Inst
    var level : Int
    
    
}