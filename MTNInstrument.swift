//
//  MTNInstrument.swift
//  NoteLearner
//
//  Created by Brian M Owen on 4/9/15.
//  Copyright (c) 2015 Brian Owen. All rights reserved.
//
//  This class has only one function, getNotes() -> [NoteView]
//  getNotes works by checking for the instrument type first, then the level. It adds notes to the array by recursively adding all the previous level's notes. This class is called by the GameManager Class during its initialization

import UIKit

class Instrument {
    
    var instrumentType: Inst
    var level : Int
    //The following won't change during the recursive trace on the getNotes() function
    let constantLevel : Int
    
    init(instrument: String, setLevel: Int){
        switch instrument{
        case "Trumpet" : self.instrumentType = .Trumpet
        case "Baritone Treble" : self.instrumentType = .BaritoneTreble
        case "Alto Saxophone" : self.instrumentType = .AltoSaxophone
        case "Tenor Saxophone" : self.instrumentType = .TenorSaxophone
        case "Baritone Saxophone" : self.instrumentType = .BaritoneSaxophone
        case "Flute" : self.instrumentType = .Flute
        case "Oboe" : self.instrumentType = .Oboe
        case "Clarinet" : self.instrumentType = .Clarinet
        case "Bass Clarinet" : self.instrumentType = .BassClarinet
        case "Alto Clarinet" : self.instrumentType = .AltoClarinet
        case "Percussion" : self.instrumentType = .Percussion
        case "French Horn" : self.instrumentType = .FrenchHorn
        case "Trombone" : self.instrumentType = .Trombone
        case "Baritone Bass" : self.instrumentType = .BaritoneBass
        case "Bassoon" : self.instrumentType = .Bassoon
        case "Electric Bass" : self.instrumentType = .ElectricBass
        case "Tuba" : self.instrumentType = .Tuba
        default : self.instrumentType = .Empty
        }
        
        self.level = setLevel
        self.constantLevel = setLevel
        
    }
    
    
    func getNotes() ->(allNotesForGame: [NoteView], newNotesOnly: [NoteView]){
        let noteList = NoteList.returnNoteList()
        var noteArray = [NoteView]()
        var newNotesOnlyArray:[NoteView] = [NoteView]()
        //newNotesOnlyArray.append(noteList["G#4t"]!)
        //newNotesOnlyArray.append(noteList["Ab4t"]!)
        //newNotesOnlyArray.append(noteList["Db5t"]!)
        
        switch instrumentType {
        case .Trumpet :
        //println("It's a trumpet")
            switch level{
                case 1 :
                    noteArray.append(noteList["E4t"]!)
                    noteArray.append(noteList["F4t"]!)
                    noteArray.append(noteList["G4t"]!)
                        if constantLevel == 1{
                            newNotesOnlyArray.append(noteList["E4t"]!)
                            newNotesOnlyArray.append(noteList["F4t"]!)
                            newNotesOnlyArray.append(noteList["G4t"]!)
                        }
                case 2 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["C4t"]!)
                    noteArray.append(noteList["D4t"]!)
                        if constantLevel == 2{
                            newNotesOnlyArray.append(noteList["C4t"]!)
                            newNotesOnlyArray.append(noteList["D4t"]!)
                        }
                    level = 2
                case 3 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["A4t"]!)
                    noteArray.append(noteList["B3t"]!)
                        if constantLevel == 3{
                            newNotesOnlyArray.append(noteList["A4t"]!)
                            newNotesOnlyArray.append(noteList["B3t"]!)
                        }
                    level = 3
                case 4 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["A3t"]!)
                        if constantLevel == 4{
                            newNotesOnlyArray.append(noteList["A3t"]!)
                        }
                    level = 4
                case 5 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Bb3t"]!)
                    noteArray.append(noteList["Bb4t"]!)
                    noteArray.append(noteList["C4t"]!)
                        if constantLevel == 5{
                            newNotesOnlyArray.append(noteList["Bb3t"]!)
                            newNotesOnlyArray.append(noteList["Bb4t"]!)
                            newNotesOnlyArray.append(noteList["C4t"]!)
                        }
                    level = 5
                case 6 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["F#4t"]!)
                    noteArray.append(noteList["B4t"]!)
                        if constantLevel == 6 {
                            newNotesOnlyArray.append(noteList["F#4t"]!)
                            newNotesOnlyArray.append(noteList["B4t"]!)
                        }
                    level = 6
                case 7 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Eb4t"]!)
                        if constantLevel == 7{
                            newNotesOnlyArray.append(noteList["Eb4t"]!)
                        }
                    level = 7
                case 8 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["D5t"]!)
                    noteArray.append(noteList["Ab4t"]!)
                        if constantLevel == 8{
                            newNotesOnlyArray.append(noteList["D5t"]!)
                            newNotesOnlyArray.append(noteList["Ab4t"]!)
                        }
                    level = 8
                case 9 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["G#4t"]!)
                    noteArray.append(noteList["D#4t"]!)
                        if constantLevel == 9 {
                            newNotesOnlyArray.append(noteList["G#4t"]!)
                            newNotesOnlyArray.append(noteList["D#4t"]!)
                        }
                    level = 9
                    
                default: break
                    
                }
            
        case .AltoSaxophone :
        //println("It's an alto sax")
            switch level{
                case 1:
                    noteArray.append(noteList["B4t"]!)
                    noteArray.append(noteList["C5t"]!)
                    noteArray.append(noteList["D5t"]!)
                        if constantLevel == 1{
                            newNotesOnlyArray.append(noteList["B4t"]!)
                            newNotesOnlyArray.append(noteList["C5t"]!)
                            newNotesOnlyArray.append(noteList["D5t"]!)
                        }
                case 2:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["G4t"]!)
                    noteArray.append(noteList["A4t"]!)
                        if constantLevel == 2 {
                            newNotesOnlyArray.append(noteList["G4t"]!)
                            newNotesOnlyArray.append(noteList["A4t"]!)
                        }
                    level = 2
                case 3:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["E5t"]!)
                    noteArray.append(noteList["F#4t"]!)
                        if constantLevel == 3{
                            newNotesOnlyArray.append(noteList["E5t"]!)
                            newNotesOnlyArray.append(noteList["F#4t"]!)
                        }
                    level = 3
                case 4:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["E4t"]!)
                    noteArray.append(noteList["D4t"]!)
                        if constantLevel == 4 {
                            newNotesOnlyArray.append(noteList["E4t"]!)
                            newNotesOnlyArray.append(noteList["D4t"]!)
                        }
                    level = 4
                case 5:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["F4t"]!)
                    noteArray.append(noteList["F5t"]!)
                    noteArray.append(noteList["G5t"]!)
                        if constantLevel == 5{
                            newNotesOnlyArray.append(noteList["F4t"]!)
                            newNotesOnlyArray.append(noteList["F5t"]!)
                            newNotesOnlyArray.append(noteList["G5t"]!)
                        }
                    level = 5
                case 6:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["C#5t"]!)
                    noteArray.append(noteList["F#5t"]!)
                        if constantLevel == 6 {
                            newNotesOnlyArray.append(noteList["C#5t"]!)
                            newNotesOnlyArray.append(noteList["F#5t"]!)
                        }
                    level = 6
                case 7:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Bb4t"]!)
                        if constantLevel == 7{
                            newNotesOnlyArray.append(noteList["Bb4t"]!)
                        }
                    level = 7
                case 8:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["A5t"]!)
                        if constantLevel == 8{
                            newNotesOnlyArray.append(noteList["A5t"]!)
                        }
                    level = 8
                case 9:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["D#5t"]!)
                    noteArray.append(noteList["A#4t"]!)
                        if constantLevel == 9{
                            newNotesOnlyArray.append(noteList["D#5t"]!)
                            newNotesOnlyArray.append(noteList["A#4t"]!)
                        }
                    level = 9
                default: break
                    
                }
        case .Flute :
                //println("It's a Flute!")
                switch level {
                case 1:
                    noteArray.append(noteList["F5t"]!)
                    noteArray.append(noteList["Eb5t"]!)
                    noteArray.append(noteList["D5t"]!)
                        if constantLevel == 1{
                            newNotesOnlyArray.append(noteList["F5t"]!)
                            newNotesOnlyArray.append(noteList["Eb5t"]!)
                            newNotesOnlyArray.append(noteList["D5t"]!)
                        }
                case 2:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["C5t"]!)
                    noteArray.append(noteList["Bb4t"]!)
                        if constantLevel == 2{
                            newNotesOnlyArray.append(noteList["C5t"]!)
                            newNotesOnlyArray.append(noteList["Bb4t"]!)
                        }
                    level = 2
                case 3:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["G5t"]!)
                    noteArray.append(noteList["A4t"]!)
                        if constantLevel == 3{
                            newNotesOnlyArray.append(noteList["G5t"]!)
                            newNotesOnlyArray.append(noteList["A4t"]!)
                        }
                    level = 3
                case 4:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["G4t"]!)
                    noteArray.append(noteList["F4t"]!)
                        if constantLevel == 4{
                            newNotesOnlyArray.append(noteList["G4t"]!)
                            newNotesOnlyArray.append(noteList["F4t"]!)
                        }
                    level = 4
                case 5:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Ab4t"]!)
                    noteArray.append(noteList["Ab5t"]!)
                    noteArray.append(noteList["Bb5t"]!)
                        if constantLevel == 5{
                            newNotesOnlyArray.append(noteList["Ab4t"]!)
                            newNotesOnlyArray.append(noteList["Ab5t"]!)
                            newNotesOnlyArray.append(noteList["Bb5t"]!)
                        }
                    level = 5
                case 6:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["E5t"]!)
                    noteArray.append(noteList["A5t"]!)
                        if constantLevel == 6{
                            newNotesOnlyArray.append(noteList["E5t"]!)
                            newNotesOnlyArray.append(noteList["A5t"]!)
                        }
                    level = 6
                case 7:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["E4t"]!)
                    noteArray.append(noteList["Db5t"]!)
                        if constantLevel == 7{
                            newNotesOnlyArray.append(noteList["E4t"]!)
                            newNotesOnlyArray.append(noteList["Db5t"]!)
                        }
                    level = 7
                case 8:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["C6t"]!)
                    noteArray.append(noteList["Gb5t"]!)
                        if constantLevel == 8{
                            newNotesOnlyArray.append(noteList["C6t"]!)
                            newNotesOnlyArray.append(noteList["Gb5t"]!)
                        }
                    level = 8
                case 9:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["F#5t"]!)
                    noteArray.append(noteList["C#5t"]!)
                        if constantLevel == 9{
                            newNotesOnlyArray.append(noteList["F#5t"]!)
                            newNotesOnlyArray.append(noteList["C#5t"]!)
                        }
                    level = 9
                default: break
            }

        case .Oboe :
            //println("You got an Oboe, bummer.")
                switch level{
                case 1:
                    noteArray.append(noteList["F5t"]!)
                    noteArray.append(noteList["Eb5t"]!)
                    noteArray.append(noteList["D5t"]!)
                        if constantLevel == 1{
                            newNotesOnlyArray.append(noteList["F5t"]!)
                            newNotesOnlyArray.append(noteList["Eb5t"]!)
                            newNotesOnlyArray.append(noteList["D5t"]!)
                        }
                case 2:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["C5t"]!)
                    noteArray.append(noteList["Bb4t"]!)
                        if constantLevel == 2{
                            newNotesOnlyArray.append(noteList["C5t"]!)
                            newNotesOnlyArray.append(noteList["Bb4t"]!)
                        }
                    level = 2
                case 3:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["G5t"]!)
                    noteArray.append(noteList["A4t"]!)
                        if constantLevel == 3{
                            newNotesOnlyArray.append(noteList["G5t"]!)
                            newNotesOnlyArray.append(noteList["A4t"]!)
                        }
                    level = 3
                case 4:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["G4t"]!)
                    noteArray.append(noteList["F4t"]!)
                        if constantLevel == 4{
                            newNotesOnlyArray.append(noteList["G4t"]!)
                            newNotesOnlyArray.append(noteList["F4t"]!)
                        }
                    level = 4
                case 5:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Ab4t"]!)
                    noteArray.append(noteList["Ab5t"]!)
                    noteArray.append(noteList["Bb5t"]!)
                    noteArray.append(noteList["Eb4t"]!)
                        if constantLevel == 5{
                            newNotesOnlyArray.append(noteList["Ab4t"]!)
                            newNotesOnlyArray.append(noteList["Ab5t"]!)
                            newNotesOnlyArray.append(noteList["Bb5t"]!)
                            newNotesOnlyArray.append(noteList["Eb4t"]!)
                        }
                    level = 5
                case 6:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["E5t"]!)
                    noteArray.append(noteList["A5t"]!)
                        if constantLevel == 6{
                            newNotesOnlyArray.append(noteList["E5t"]!)
                            newNotesOnlyArray.append(noteList["A5t"]!)
                        }
                    level = 6
                case 7:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["E4t"]!)
                    noteArray.append(noteList["Db5t"]!)
                        if constantLevel == 7{
                            newNotesOnlyArray.append(noteList["E4t"]!)
                            newNotesOnlyArray.append(noteList["Db5t"]!)
                        }
                    level = 7
                case 8:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["D4t"]!)
                    noteArray.append(noteList["C4t"]!)
                        if constantLevel == 8{
                            newNotesOnlyArray.append(noteList["D4t"]!)
                            newNotesOnlyArray.append(noteList["C4t"]!)
                        }
                    level = 8
                case 9:
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["F#4t"]!)
                    noteArray.append(noteList["Gb4t"]!)
                    noteArray.append(noteList["F#5t"]!)
                    noteArray.append(noteList["Gb5t"]!)
                    noteArray.append(noteList["C#5t"]!)
                    if constantLevel == 9{
                        newNotesOnlyArray.append(noteList["F#4t"]!)
                        newNotesOnlyArray.append(noteList["Gb4t"]!)
                        newNotesOnlyArray.append(noteList["F#5t"]!)
                        newNotesOnlyArray.append(noteList["Gb5t"]!)
                        newNotesOnlyArray.append(noteList["C#5t"]!)
                    }
                    level = 9
                    
                default: break
            }

        case .Clarinet :
            //println("You pulled Clarinet, better luck next time")
            switch level{
                case 1 :
                    noteArray.append(noteList["E4t"]!)
                    noteArray.append(noteList["F4t"]!)
                    noteArray.append(noteList["G4t"]!)
                        if constantLevel == 1 {
                            newNotesOnlyArray.append(noteList["E4t"]!)
                            newNotesOnlyArray.append(noteList["F4t"]!)
                            newNotesOnlyArray.append(noteList["G4t"]!)
                        }
                    
                case 2 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["C4t"]!)
                    noteArray.append(noteList["D4t"]!)
                        if constantLevel == 2{
                            newNotesOnlyArray.append(noteList["C4t"]!)
                            newNotesOnlyArray.append(noteList["D4t"]!)
                        }
                    level = 2
                case 3 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["A4t"]!)
                    noteArray.append(noteList["B3t"]!)
                        if constantLevel == 3{
                            newNotesOnlyArray.append(noteList["A4t"]!)
                            newNotesOnlyArray.append(noteList["B3t"]!)
                        }
                    level = 3
                case 4 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["A3t"]!)
                    noteArray.append(noteList["G3t"]!)
                        if constantLevel == 4{
                            newNotesOnlyArray.append(noteList["A3t"]!)
                            newNotesOnlyArray.append(noteList["G3t"]!)
                        }
                    level = 4
                case 5 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Bb3t"]!)
                    noteArray.append(noteList["Bb4t"]!)
                    noteArray.append(noteList["F3t"]!)
                        if constantLevel == 5{
                            newNotesOnlyArray.append(noteList["Bb3t"]!)
                            newNotesOnlyArray.append(noteList["Bb4t"]!)
                            newNotesOnlyArray.append(noteList["F3t"]!)
                        }
                    level = 5
                case 6 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["F#4t"]!)
                        if constantLevel == 6{
                            newNotesOnlyArray.append(noteList["F#4t"]!)
                        }
                    level = 6
                case 7 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Eb4t"]!)
                        if constantLevel == 7{
                            newNotesOnlyArray.append(noteList["Eb4t"]!)
                        }
                    level = 7
                case 8 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["D5t"]!)
                    noteArray.append(noteList["E5t"]!)
                    noteArray.append(noteList["F5t"]!)
                        if constantLevel == 8{
                            newNotesOnlyArray.append(noteList["D5t"]!)
                            newNotesOnlyArray.append(noteList["E5t"]!)
                            newNotesOnlyArray.append(noteList["F5t"]!)
                        }
                    level = 8
                case 9 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["F#5t"]!)
                    noteArray.append(noteList["C4t"]!)
                    noteArray.append(noteList["G5t"]!)
                    noteArray.append(noteList["E3t"]!)
                    noteArray.append(noteList["B4t"]!)
                    noteArray.append(noteList["G#4t"]!)
                    noteArray.append(noteList["Ab4t"]!)
                    noteArray.append(noteList["Eb4t"]!)
                    noteArray.append(noteList["D#4t"]!)
                    noteArray.append(noteList["F#4t"]!)
                        if constantLevel == 9{
                            newNotesOnlyArray.append(noteList["F#5t"]!)
                            newNotesOnlyArray.append(noteList["C4t"]!)
                            newNotesOnlyArray.append(noteList["G5t"]!)
                            newNotesOnlyArray.append(noteList["E3t"]!)
                            newNotesOnlyArray.append(noteList["B4t"]!)
                            newNotesOnlyArray.append(noteList["G#4t"]!)
                            newNotesOnlyArray.append(noteList["Ab4t"]!)
                            newNotesOnlyArray.append(noteList["Eb4t"]!)
                            newNotesOnlyArray.append(noteList["D#4t"]!)
                            newNotesOnlyArray.append(noteList["F#4t"]!)
                        }

                    level = 9

                default: break
            }

        case .BassClarinet :
                instrumentType = .Clarinet
                let tempNoteArray = getNotes()
                noteArray = tempNoteArray.allNotesForGame
                newNotesOnlyArray = tempNoteArray.newNotesOnly
                instrumentType = .BassClarinet
        case .AltoClarinet :
            //println("Hauling an Alto Clarinet this time")
            switch level{
                case 1 :
                    noteArray.append(noteList["D4t"]!)
                    noteArray.append(noteList["C4t"]!)
                    noteArray.append(noteList["B3t"]!)
                        if constantLevel == 1{
                            newNotesOnlyArray.append(noteList["D4t"]!)
                            newNotesOnlyArray.append(noteList["C4t"]!)
                            newNotesOnlyArray.append(noteList["B3t"]!)
                        }
                case 2 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["A3t"]!)
                    noteArray.append(noteList["G3t"]!)
                        if constantLevel == 2{
                            newNotesOnlyArray.append(noteList["A3t"]!)
                            newNotesOnlyArray.append(noteList["G3t"]!)
                        }
                    level = 2
                case 3 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["E4t"]!)
                    noteArray.append(noteList["F#3t"]!)
                        if constantLevel == 3{
                            newNotesOnlyArray.append(noteList["E4t"]!)
                            newNotesOnlyArray.append(noteList["F#3t"]!)
                        }
                    level = 3
                case 4 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["E3t"]!)
                        if constantLevel == 4{
                            newNotesOnlyArray.append(noteList["E3t"]!)
                        }
                    level = 4
                case 5 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["F3t"]!)
                    noteArray.append(noteList["F4t"]!)
                    noteArray.append(noteList["G4t"]!)
                        if constantLevel == 5 {
                            newNotesOnlyArray.append(noteList["F3t"]!)
                            newNotesOnlyArray.append(noteList["F4t"]!)
                            newNotesOnlyArray.append(noteList["G4t"]!)
                        }
                    level = 5
                case 6 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["C#4t"]!)
                    noteArray.append(noteList["F#4t"]!)
                        if constantLevel == 6{
                            newNotesOnlyArray.append(noteList["C#4t"]!)
                            newNotesOnlyArray.append(noteList["F#4t"]!)
                        }
                    level = 6
                case 7 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Bb3t"]!)
                        if constantLevel == 7{
                            newNotesOnlyArray.append(noteList["Bb3t"]!)
                        }
                    level = 7
                case 8 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["A4t"]!)
                        if constantLevel == 8{
                            newNotesOnlyArray.append(noteList["A4t"]!)
                        }
                    level = 8
                case 9 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Eb4t"]!)
                    noteArray.append(noteList["D#4t"]!)
                    noteArray.append(noteList["A#3t"]!)
                        if constantLevel == 9{
                            newNotesOnlyArray.append(noteList["Eb4t"]!)
                            newNotesOnlyArray.append(noteList["D#4t"]!)
                            newNotesOnlyArray.append(noteList["A#3t"]!)
                        }
                    level = 9
                default: break
            }


        case .TenorSaxophone :
            //println("It's Tenor Sax Time!")
            switch level{
                case 1 :
                    noteArray.append(noteList["E5t"]!)
                    noteArray.append(noteList["F5t"]!)
                    noteArray.append(noteList["G5t"]!)
                        if constantLevel == 1{
                            newNotesOnlyArray.append(noteList["E5t"]!)
                            newNotesOnlyArray.append(noteList["F5t"]!)
                            newNotesOnlyArray.append(noteList["G5t"]!)
                        }
                    
                case 2 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["C5t"]!)
                    noteArray.append(noteList["D5t"]!)
                        if constantLevel == 2{
                            newNotesOnlyArray.append(noteList["C5t"]!)
                            newNotesOnlyArray.append(noteList["D5t"]!)
                        }
                    level = 2
                case 3 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["A5t"]!)
                    noteArray.append(noteList["B4t"]!)
                        if constantLevel == 3{
                            newNotesOnlyArray.append(noteList["A5t"]!)
                            newNotesOnlyArray.append(noteList["B4t"]!)
                        }
                    level = 3
                case 4 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["A4t"]!)
                    noteArray.append(noteList["G4t"]!)
                        if constantLevel == 4{
                            newNotesOnlyArray.append(noteList["A4t"]!)
                            newNotesOnlyArray.append(noteList["G4t"]!)
                        }
                    level = 4
                case 5 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Bb4t"]!)
                    noteArray.append(noteList["Bb5t"]!)
                    noteArray.append(noteList["C5t"]!)
                    noteArray.append(noteList["F4t"]!)
                        if constantLevel == 5{
                            newNotesOnlyArray.append(noteList["Bb4t"]!)
                            newNotesOnlyArray.append(noteList["Bb5t"]!)
                            newNotesOnlyArray.append(noteList["C5t"]!)
                            newNotesOnlyArray.append(noteList["F4t"]!)
                        }
                    level = 5
                case 6 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["F#5t"]!)
                    noteArray.append(noteList["B5t"]!)
                        if constantLevel == 6{
                            newNotesOnlyArray.append(noteList["F#5t"]!)
                            newNotesOnlyArray.append(noteList["B5t"]!)
                        }
                    level = 6
                case 7 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Eb5t"]!)
                    noteArray.append(noteList["F#4t"]!)
                        if constantLevel == 7{
                            newNotesOnlyArray.append(noteList["Eb5t"]!)
                            newNotesOnlyArray.append(noteList["F#4t"]!)
                        }
                    level = 7
                case 8 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["E4t"]!)
                    noteArray.append(noteList["D4t"]!)
                        if constantLevel == 8{
                            newNotesOnlyArray.append(noteList["E4t"]!)
                            newNotesOnlyArray.append(noteList["D4t"]!)
                        }
                    level = 8
                case 9 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["C4t"]!)
                    noteArray.append(noteList["Ab5t"]!)
                    noteArray.append(noteList["G#5t"]!)
                    noteArray.append(noteList["D#5t"]!)
                        if constantLevel == 9{
                            newNotesOnlyArray.append(noteList["C4t"]!)
                            newNotesOnlyArray.append(noteList["Ab5t"]!)
                            newNotesOnlyArray.append(noteList["G#5t"]!)
                            newNotesOnlyArray.append(noteList["D#5t"]!)
                        }
                    level = 9
                    
                default: break
                
            }
        case .BaritoneTreble :
            //println("It's a Baritone in Treble")
            switch level{
                case 1 :
                    noteArray.append(noteList["E4t"]!)
                    noteArray.append(noteList["F4t"]!)
                    noteArray.append(noteList["G4t"]!)
                        if constantLevel == 1{
                            newNotesOnlyArray.append(noteList["E4t"]!)
                            newNotesOnlyArray.append(noteList["F4t"]!)
                            newNotesOnlyArray.append(noteList["G4t"]!)
                        }
                    
                case 2 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["C4t"]!)
                    noteArray.append(noteList["D4t"]!)
                        if constantLevel == 2{
                            newNotesOnlyArray.append(noteList["C4t"]!)
                            newNotesOnlyArray.append(noteList["D4t"]!)
                        }
                    level = 2
                case 3 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["A4t"]!)
                    noteArray.append(noteList["B3t"]!)
                        if constantLevel == 3{
                            newNotesOnlyArray.append(noteList["A4t"]!)
                            newNotesOnlyArray.append(noteList["B3t"]!)
                        }
                    level = 3
                case 4 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["A3t"]!)
                        if constantLevel == 4{
                            newNotesOnlyArray.append(noteList["A3t"]!)
                        }
                    level = 4
                case 5 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Bb3t"]!)
                    noteArray.append(noteList["Bb4t"]!)
                    noteArray.append(noteList["C4t"]!)
                        if constantLevel == 5{
                            newNotesOnlyArray.append(noteList["Bb3t"]!)
                            newNotesOnlyArray.append(noteList["Bb4t"]!)
                            newNotesOnlyArray.append(noteList["C4t"]!)
                        }
                    level = 5
                case 6 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["F#4t"]!)
                    noteArray.append(noteList["B4t"]!)
                        if constantLevel == 6{
                            newNotesOnlyArray.append(noteList["F#4t"]!)
                            newNotesOnlyArray.append(noteList["B4t"]!)
                        }
                    level = 6
                case 7 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Eb4t"]!)
                        if constantLevel == 7{
                            newNotesOnlyArray.append(noteList["Eb4t"]!)
                        }
                    level = 7
                case 8 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["D5t"]!)
                    noteArray.append(noteList["Ab4t"]!)
                        if constantLevel == 8{
                            newNotesOnlyArray.append(noteList["D5t"]!)
                            newNotesOnlyArray.append(noteList["Ab4t"]!)
                        }
                    level = 8
                case 9 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["G#4t"]!)
                    noteArray.append(noteList["D#4t"]!)
                        if constantLevel == 9{
                            newNotesOnlyArray.append(noteList["G#4t"]!)
                            newNotesOnlyArray.append(noteList["D#4t"]!)
                        }
                    level = 9
                    
                default: break
                
            }

        case .Trombone :
            //println("It's a Trombone!")
            switch level{
                case 1 :
                    noteArray.append(noteList["F3b"]!)
                    noteArray.append(noteList["Eb3b"]!)
                    noteArray.append(noteList["D3b"]!)
                        if constantLevel == 1{
                            newNotesOnlyArray.append(noteList["F3b"]!)
                            newNotesOnlyArray.append(noteList["Eb3b"]!)
                            newNotesOnlyArray.append(noteList["D3b"]!)
                        }
                    
                case 2 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["C3b"]!)
                    noteArray.append(noteList["Bb2b"]!)
                        if constantLevel == 2{
                            newNotesOnlyArray.append(noteList["C3b"]!)
                            newNotesOnlyArray.append(noteList["Bb2b"]!)
                        }
                    level = 2
                case 3 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["G3b"]!)
                    noteArray.append(noteList["A2b"]!)
                        if constantLevel == 3{
                            newNotesOnlyArray.append(noteList["G3b"]!)
                            newNotesOnlyArray.append(noteList["A2b"]!)
                        }
                    level = 3
                case 4 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Ab2b"]!)
                        if constantLevel == 4{
                            newNotesOnlyArray.append(noteList["Ab2b"]!)
                        }
                    level = 4
                case 5 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Ab3b"]!)
                    noteArray.append(noteList["Bb3b"]!)
                        if constantLevel == 5{
                            newNotesOnlyArray.append(noteList["Ab3b"]!)
                            newNotesOnlyArray.append(noteList["Bb3b"]!)
                        }
                    level = 5
                case 6 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["A3b"]!)
                        if constantLevel == 6{
                            newNotesOnlyArray.append(noteList["A3b"]!)
                        }
                    level = 6
                case 7 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Db3b"]!)
                        if constantLevel == 7{
                            newNotesOnlyArray.append(noteList["Db3b"]!)
                        }
                    level = 7
                case 8 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["C4b"]!)
                        if constantLevel == 8{
                            newNotesOnlyArray.append(noteList["C4b"]!)
                        }
                    level = 8
                case 9 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Gb3b"]!)
                    noteArray.append(noteList["F#3b"]!)
                    noteArray.append(noteList["C#3b"]!)
                        if constantLevel == 9{
                            newNotesOnlyArray.append(noteList["Gb3b"]!)
                            newNotesOnlyArray.append(noteList["F#3b"]!)
                            newNotesOnlyArray.append(noteList["C#3b"]!)
                        }

                    level = 9
                    
                default: break
                
            }

        case .ElectricBass :
            //println("It's an Electric Bass!")
            switch level{
                case 1 :
                    noteArray.append(noteList["F3b"]!)
                    noteArray.append(noteList["Eb3b"]!)
                    noteArray.append(noteList["D3b"]!)
                        if constantLevel == 1{
                            newNotesOnlyArray.append(noteList["F3b"]!)
                            newNotesOnlyArray.append(noteList["Eb3b"]!)
                            newNotesOnlyArray.append(noteList["D3b"]!)
                        }
                case 2 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["C3b"]!)
                    noteArray.append(noteList["Bb2b"]!)
                        if constantLevel == 2{
                            newNotesOnlyArray.append(noteList["C3b"]!)
                            newNotesOnlyArray.append(noteList["Bb2b"]!)
                        }
                    level = 2
                case 3 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["G3b"]!)
                    noteArray.append(noteList["A2b"]!)
                        if constantLevel == 3{
                            newNotesOnlyArray.append(noteList["G3b"]!)
                            newNotesOnlyArray.append(noteList["A2b"]!)
                        }
                    level = 3
                case 4 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["E2b"]!)
                        if constantLevel == 4{
                            newNotesOnlyArray.append(noteList["E2b"]!)
                        }
                    level = 4
                case 5 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Ab2b"]!)
                    noteArray.append(noteList["Ab3b"]!)
                    noteArray.append(noteList["Bb3b"]!)
                        if constantLevel == 5{
                            newNotesOnlyArray.append(noteList["Ab2b"]!)
                            newNotesOnlyArray.append(noteList["Ab3b"]!)
                            newNotesOnlyArray.append(noteList["Bb3b"]!)
                        }
                    level = 5
                case 6 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["A3b"]!)
                        if constantLevel == 6{
                            newNotesOnlyArray.append(noteList["A3b"]!)
                        }
                    level = 6
                case 7 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Db3b"]!)
                        if constantLevel == 7{
                            newNotesOnlyArray.append(noteList["Db3b"]!)
                        }
                    level = 7
                case 8 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["C4b"]!)
                        if constantLevel == 8{
                            newNotesOnlyArray.append(noteList["C4b"]!)
                        }
                    level = 8
                case 9 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Gb3b"]!)
                    noteArray.append(noteList["F#3b"]!)
                    noteArray.append(noteList["C#3b"]!)
                        if constantLevel == 9{
                            newNotesOnlyArray.append(noteList["Gb3b"]!)
                            newNotesOnlyArray.append(noteList["F#3b"]!)
                            newNotesOnlyArray.append(noteList["C#3b"]!)
                        }
                    
                    level = 9
                
            default: break
                
            }

        case .Tuba :
            //println("It's a Tuba!")
            switch level{
                case 1 :
                    noteArray.append(noteList["F2b"]!)
                    noteArray.append(noteList["Eb2b"]!)
                    noteArray.append(noteList["D2b"]!)
                        if constantLevel == 1{
                            newNotesOnlyArray.append(noteList["F2b"]!)
                            newNotesOnlyArray.append(noteList["Eb2b"]!)
                            newNotesOnlyArray.append(noteList["D2b"]!)
                        }
                    
                case 2 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["C2b"]!)
                    noteArray.append(noteList["Bb1b"]!)
                        if constantLevel == 2{
                            newNotesOnlyArray.append(noteList["C2b"]!)
                            newNotesOnlyArray.append(noteList["Bb1b"]!)
                        }
                    level = 2
                case 3 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["G2b"]!)
                    noteArray.append(noteList["A1b"]!)
                        if constantLevel == 3{
                            newNotesOnlyArray.append(noteList["G2b"]!)
                            newNotesOnlyArray.append(noteList["A1b"]!)
                        }
                    level = 3
                case 4 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Ab1b"]!)
                        if constantLevel == 4{
                            newNotesOnlyArray.append(noteList["Ab1b"]!)
                        }
                    level = 4
                case 5 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Ab2b"]!)
                    noteArray.append(noteList["Bb2b"]!)
                        if constantLevel == 5{
                            newNotesOnlyArray.append(noteList["Ab2b"]!)
                            newNotesOnlyArray.append(noteList["Bb2b"]!)
                        }
                    level = 5
                case 6 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["E2b"]!)
                    noteArray.append(noteList["A2b"]!)
                        if constantLevel == 6{
                            newNotesOnlyArray.append(noteList["E2b"]!)
                            newNotesOnlyArray.append(noteList["A2b"]!)
                        }
                    level = 6
                case 7 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Db2b"]!)
                        if constantLevel == 7{
                            newNotesOnlyArray.append(noteList["Db2b"]!)
                        }
                    level = 7
                case 8 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["C3b"]!)
                        if constantLevel == 8{
                            newNotesOnlyArray.append(noteList["C3b"]!)
                        }
                    level = 8
                case 9 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Gb2b"]!)
                    noteArray.append(noteList["F#2b"]!)
                    noteArray.append(noteList["C#2b"]!)
                        if constantLevel == 9{
                            newNotesOnlyArray.append(noteList["Gb2b"]!)
                            newNotesOnlyArray.append(noteList["F#2b"]!)
                            newNotesOnlyArray.append(noteList["C#2b"]!)
                        }
                    level = 9
                
                    
                default: break
                    
            }
            

        case .FrenchHorn :
            //println("It's a French Horn!")
            switch level{
                case 1 :
                    noteArray.append(noteList["G4t"]!)
                    noteArray.append(noteList["F4t"]!)
                    noteArray.append(noteList["E4t"]!)
                        if constantLevel == 1{
                            newNotesOnlyArray.append(noteList["G4t"]!)
                            newNotesOnlyArray.append(noteList["F4t"]!)
                            newNotesOnlyArray.append(noteList["E4t"]!)
                        }
                    
                case 2 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["D4t"]!)
                    noteArray.append(noteList["C4t"]!)
                        if constantLevel == 2{
                            newNotesOnlyArray.append(noteList["D4t"]!)
                            newNotesOnlyArray.append(noteList["C4t"]!)
                        }
                    level = 2
                case 3 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["A4t"]!)
                    noteArray.append(noteList["B3t"]!)
                        if constantLevel == 3{
                            newNotesOnlyArray.append(noteList["A4t"]!)
                            newNotesOnlyArray.append(noteList["B3t"]!)
                        }
                    level = 3
                case 4 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["A3t"]!)
                    noteArray.append(noteList["Bb3t"]!)
                    noteArray.append(noteList["Bb4t"]!)
                    noteArray.append(noteList["C5t"]!)
                    noteArray.append(noteList["D5t"]!)
                        if constantLevel == 4{
                            newNotesOnlyArray.append(noteList["A3t"]!)
                            newNotesOnlyArray.append(noteList["Bb3t"]!)
                            newNotesOnlyArray.append(noteList["Bb4t"]!)
                            newNotesOnlyArray.append(noteList["C5t"]!)
                            newNotesOnlyArray.append(noteList["D5t"]!)
                        }
                    level = 4
                case 5 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Eb4t"]!)
                    noteArray.append(noteList["Eb5t"]!)
                    noteArray.append(noteList["F5t"]!)
                        if constantLevel == 5{
                            newNotesOnlyArray.append(noteList["Eb4t"]!)
                            newNotesOnlyArray.append(noteList["Eb5t"]!)
                            newNotesOnlyArray.append(noteList["F5t"]!)
                        }
                    level = 5
                case 6 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["B4t"]!)
                    noteArray.append(noteList["E5t"]!)
                        if constantLevel == 6{
                            newNotesOnlyArray.append(noteList["B4t"]!)
                            newNotesOnlyArray.append(noteList["E5t"]!)
                        }
                    level = 6
                case 7 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Ab4t"]!)
                        if constantLevel == 7{
                            newNotesOnlyArray.append(noteList["Ab4t"]!)
                        }
                    level = 7
                case 8 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Db5t"]!)
                    noteArray.append(noteList["C#5t"]!)
                        if constantLevel == 8{
                            newNotesOnlyArray.append(noteList["Db5t"]!)
                            newNotesOnlyArray.append(noteList["C#5t"]!)
                        }
                    level = 8
                case 9 :
                    level = level-1
                    let tempNoteArray = getNotes()
                    noteArray = tempNoteArray.allNotesForGame
                    noteArray.append(noteList["Ab4t"]!)
                    noteArray.append(noteList["G#4t"]!)
                        if constantLevel == 9{
                            newNotesOnlyArray.append(noteList["Ab4t"]!)
                            newNotesOnlyArray.append(noteList["G#4t"]!)
                        }
                    level = 9
            
                default: break
                
            }
        
        case .BaritoneBass :
            //println("Gotcha a bass clef Baritone")
                instrumentType = .Trombone
                let tempNoteArray = getNotes()
                noteArray = tempNoteArray.allNotesForGame
                newNotesOnlyArray = tempNoteArray.newNotesOnly
                instrumentType = .BaritoneBass
        case .Bassoon :
            //println("Gotcha a Bassoon")
                instrumentType = .Trombone
                let tempNoteArray = getNotes()
                noteArray = tempNoteArray.allNotesForGame
                newNotesOnlyArray = tempNoteArray.newNotesOnly
                instrumentType = .Bassoon
        case .Percussion :
            //println("The Percussion in the back row")
                instrumentType = .Flute
                let tempNoteArray = getNotes()
                noteArray = tempNoteArray.allNotesForGame
                newNotesOnlyArray = tempNoteArray.newNotesOnly
                instrumentType = .Percussion
        case .BaritoneSaxophone :
            //println("It's the Bari")
                instrumentType = .AltoSaxophone
                let tempNoteArray = getNotes()
                noteArray = tempNoteArray.allNotesForGame
                newNotesOnlyArray = tempNoteArray.newNotesOnly
                instrumentType = .BaritoneSaxophone

        default :
        //println("No instrument selected")
            break
        }

        
        return (noteArray, newNotesOnlyArray)
    }
    

    
    
}