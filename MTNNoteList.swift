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

        noteList["E3t"] = NoteView (note: 5, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("E3t", ofType: "png")!))
        noteList["F3t"] = NoteView (note: 6, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("F3t", ofType: "png")!))
        noteList["F#3t"] = NoteView (note: 7, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("F#3t", ofType: "png")!))
        noteList["G3t"] = NoteView (note: 8, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("G3t", ofType: "png")!))
        noteList["A3t"] = NoteView (note: 10, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("A3t", ofType: "png")!))
        noteList["A#3t"] = NoteView (note: 11, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("A#3t", ofType: "png")!))
        noteList["Bb3t"] = NoteView (note: 11, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("Bb3t", ofType: "png")!))
        noteList["B3t"] = NoteView (note: 12, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("B3t", ofType: "png")!))
        
        noteList["C4t"] = NoteView (note: 1, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("C4t", ofType: "png")!))
        noteList["C#4t"] = NoteView (note: 2, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("C#4t", ofType: "png")!))
        noteList["D4t"] = NoteView (note: 3, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("D4t", ofType: "png")!))
        noteList["D#4t"] = NoteView (note: 4, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("D#4t", ofType: "png")!))
        noteList["Eb4t"] = NoteView (note: 4, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("Eb4t", ofType: "png")!))
        noteList["E4t"] = NoteView (note: 5, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("E4t", ofType: "png")!))
        noteList["F4t"] = NoteView (note: 6, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("F4t", ofType: "png")!))
        noteList["F#4t"] = NoteView (note: 7, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("F#4t", ofType: "png")!))
        noteList["Gb4t"] = NoteView (note: 7, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("Gb4t", ofType: "png")!))
        noteList["G4t"] = NoteView (note: 8, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("G4t", ofType: "png")!))
        noteList["G#4t"] = NoteView (note: 9, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("G#4t", ofType: "png")!))
        noteList["Ab4t"] = NoteView (note: 9, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("Ab4t", ofType: "png")!))
        noteList["A4t"] = NoteView (note: 10, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("A4t", ofType: "png")!))
        noteList["A#4t"] = NoteView (note: 11, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("A#4t", ofType: "png")!))
        noteList["Bb4t"] = NoteView (note: 11, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("Bb4t", ofType: "png")!))
        noteList["B4t"] = NoteView (note: 12, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("B4t", ofType: "png")!))
        
        noteList["C5t"] = NoteView (note: 1, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("C5t", ofType: "png")!))
        noteList["C#5t"] = NoteView (note: 2, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("C#5t", ofType: "png")!))
        noteList["Db5t"] = NoteView (note: 2, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("Db5t", ofType: "png")!))
        noteList["D5t"] = NoteView (note: 3, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("D5t", ofType: "png")!))
        noteList["D#5t"] = NoteView (note: 4, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("D#5t", ofType: "png")!))
        noteList["Eb5t"] = NoteView (note: 4, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("Eb5t", ofType: "png")!))
        noteList["E5t"] = NoteView (note: 5, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("E5t", ofType: "png")!))
        noteList["F5t"] = NoteView (note: 6, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("F5t", ofType: "png")!))
        noteList["F#5t"] = NoteView (note: 7, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("F#5t", ofType: "png")!))
        noteList["Gb5t"] = NoteView (note: 7, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("Gb5t", ofType: "png")!))
        noteList["G5t"] = NoteView (note: 8, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("G5t", ofType: "png")!))
        noteList["G#5t"] = NoteView (note: 9, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("G#5t", ofType: "png")!))
        noteList["Ab5t"] = NoteView (note: 9, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("Ab5t", ofType: "png")!))
        noteList["A5t"] = NoteView (note: 10, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("A5t", ofType: "png")!))
        noteList["Bb5t"] = NoteView (note: 11, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("Bb5t", ofType: "png")!))
        noteList["B5t"] = NoteView (note: 12, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("B5t", ofType: "png")!))

        noteList["C6t"] = NoteView (note: 1, noteImage: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("C6t", ofType: "png")!))

        
        return noteList
    }


}