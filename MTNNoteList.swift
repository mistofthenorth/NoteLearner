//
//  MTNNoteList.swift
//  NoteLearner
//
//  Created by Brian M Owen on 4/19/15.
//  Copyright (c) 2015 Brian Owen. All rights reserved.
//

import UIKit

class NoteList{

    class func returnNoteList() -> [String: NoteView] {
        var noteList = [String : NoteView]()
        
        noteList["C4t"] = NoteView (note: 1, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("C4t", ofType: "png")!))
        noteList["D4t"] = NoteView (note: 3, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("D4t", ofType: "png")!))
        noteList["E4t"] = NoteView (note: 5, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("E4t", ofType: "png")!))
        noteList["F4t"] = NoteView (note: 6, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("F4t", ofType: "png")!))
        noteList["F#4t"] = NoteView (note: 7, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("F#4t", ofType: "png")!))
        noteList["G4t"] = NoteView (note: 8, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("G4t", ofType: "png")!))
        noteList["A4t"] = NoteView (note: 10, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("A4t", ofType: "png")!))
        noteList["B4t"] = NoteView (note: 12, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("B4t", ofType: "png")!))
        noteList["C5t"] = NoteView (note: 1, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("C5t", ofType: "png")!))
        noteList["D5t"] = NoteView (note: 3, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("D5t", ofType: "png")!))
        noteList["E5t"] = NoteView (note: 5, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("E5t", ofType: "png")!))
        

        return noteList
    }


}