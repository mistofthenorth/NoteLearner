//
//  MTNInstrument.swift
//  NoteLearner
//
//  Created by Brian M Owen on 4/9/15.
//  Copyright (c) 2015 Brian Owen. All rights reserved.
//

import UIKit

class Instrument {
    
    init(instrument: String, setLevel: Int){
        switch instrument{
        case "Trumpet" : instrumentType = .Trumpet
        case "Baritone Treble" : instrumentType = .BaritoneTreble
        case "Alto Saxophone" : instrumentType = .AltoSaxophone
        case "Tenor Saxophone" : instrumentType = .TenorSaxophone
        case "Baritone Saxophone" : instrumentType = .BaritoneSaxophone
        case "Flute" : instrumentType = .Flute
        case "Oboe" : instrumentType = .Oboe
        case "Clarinet" : instrumentType = .Clarinet
        case "Bass Clarinet" : instrumentType = .BassClarinet
        case "Alto Clarinet" : instrumentType = .AltoClarinet
        case "Percussion" : instrumentType = .Percussion
        default : instrumentType = .Empty
        }
        
        
        level = setLevel
        
    }
    
    
    func getNotes() ->[NoteView]{
        var noteArray = [NoteView]()
        let noteList = NoteList.returnNoteList()
        
        switch instrumentType {
        case .Trumpet :
        println("It's a trumpet")
            switch level{
                case 1 :
                    noteArray.append(noteList["E4t"]!)
                    noteArray.append(noteList["F4t"]!)
                    noteArray.append(noteList["G4t"]!)
                    
                case 2 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["C4t"]!)
                    noteArray.append(noteList["D4t"]!)
                    level = 2
                case 3 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["A4t"]!)
                    noteArray.append(noteList["B3t"]!)
                    level = 3
                case 4 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["A3t"]!)
                    level = 4
                case 5 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["Bb3t"]!)
                    noteArray.append(noteList["Bb4t"]!)
                    noteArray.append(noteList["C4t"]!)
                    level = 5
                case 6 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["F#4t"]!)
                    noteArray.append(noteList["B4t"]!)
                    level = 6
                case 7 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["Eb4t"]!)
                    level = 7
                case 8 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["D5t"]!)
                    noteArray.append(noteList["Ab4t"]!)
                    level = 8
                case 9 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["G#4t"]!)
                    noteArray.append(noteList["D#4t"]!)
                    level = 9
                    
                default: break
                    
                }
        case .AltoSaxophone :
        println("It's an alto sax")
            switch level{
                case 1:
                    noteArray.append(noteList["B4t"]!)
                    noteArray.append(noteList["C5t"]!)
                    noteArray.append(noteList["D5t"]!)
                    
                case 2:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["G4t"]!)
                    noteArray.append(noteList["A4t"]!)
                    level = 2
                case 3:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["E5t"]!)
                    noteArray.append(noteList["F#4t"]!)
                    level = 3
                case 4:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["E4t"]!)
                    noteArray.append(noteList["D4t"]!)
                    level = 4
                case 5:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["F4t"]!)
                    noteArray.append(noteList["F5t"]!)
                    noteArray.append(noteList["G5t"]!)
                    level = 5
                case 6:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["C#5t"]!)
                    noteArray.append(noteList["F#5t"]!)
                    level = 6
                case 7:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["Bb4t"]!)
                    level = 7
                case 8:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["A5t"]!)
                    level = 8
                case 9:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["D#5t"]!)
                    noteArray.append(noteList["A#4t"]!)
                    level = 9
                default: break
                    
                }
            
        case .Flute :
                println("It's a Flute!")
                switch level {
                case 1:
                    noteArray.append(noteList["F5t"]!)
                    noteArray.append(noteList["Eb5t"]!)
                    noteArray.append(noteList["D5t"]!)
                case 2:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["C5t"]!)
                    noteArray.append(noteList["Bb4t"]!)
                    level = 2
                case 3:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["G5t"]!)
                    noteArray.append(noteList["A4t"]!)
                    level = 3
                case 4:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["G4t"]!)
                    noteArray.append(noteList["F4t"]!)
                    level = 4
                case 5:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["Ab4t"]!)
                    noteArray.append(noteList["Ab5t"]!)
                    noteArray.append(noteList["Bb5t"]!)
                    level = 5
                case 6:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["E5t"]!)
                    noteArray.append(noteList["A5t"]!)
                    level = 6
                case 7:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["E4t"]!)
                    noteArray.append(noteList["Db5t"]!)
                    level = 7
                case 8:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["C6t"]!)
                    noteArray.append(noteList["Gb5t"]!)
                    level = 8
                case 9:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["F#5t"]!)
                    noteArray.append(noteList["C#5t"]!)
                    level = 9
                default: break
            }
        case .Oboe :
            println("You got an Oboe, bummer.")
                switch level{
                case 1:
                    noteArray.append(noteList["F5t"]!)
                    noteArray.append(noteList["Eb5t"]!)
                    noteArray.append(noteList["D5t"]!)
                case 2:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["C5t"]!)
                    noteArray.append(noteList["Bb4t"]!)
                    level = 2
                case 3:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["G5t"]!)
                    noteArray.append(noteList["A4t"]!)
                    level = 3
                case 4:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["G4t"]!)
                    noteArray.append(noteList["F4t"]!)
                    level = 4
                case 5:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["Ab4t"]!)
                    noteArray.append(noteList["Ab5t"]!)
                    noteArray.append(noteList["Bb5t"]!)
                    noteArray.append(noteList["Eb4t"]!)
                    level = 5
                case 6:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["E5t"]!)
                    noteArray.append(noteList["A5t"]!)
                    level = 6
                case 7:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["E4t"]!)
                    noteArray.append(noteList["Db5t"]!)
                    level = 7
                case 8:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["D4t"]!)
                    noteArray.append(noteList["C4t"]!)
                    level = 8
                case 9:
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["F#4t"]!)
                    noteArray.append(noteList["Gb4t"]!)
                    noteArray.append(noteList["F#5t"]!)
                    noteArray.append(noteList["Gb5t"]!)
                    noteArray.append(noteList["C#5t"]!)
                    level = 9
                    
                default: break
            }
        case .Clarinet :
            println("You pulled Clarinet, better luck next time")
            switch level{
            case 1 :
                noteArray.append(noteList["E4t"]!)
                noteArray.append(noteList["F4t"]!)
                noteArray.append(noteList["G4t"]!)
                
            case 2 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["C4t"]!)
                noteArray.append(noteList["D4t"]!)
                level = 2
            case 3 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["A4t"]!)
                noteArray.append(noteList["B3t"]!)
                level = 3
            case 4 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["A3t"]!)
                noteArray.append(noteList["G3t"]!)
                level = 4
            case 5 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["Bb3t"]!)
                noteArray.append(noteList["Bb4t"]!)
                noteArray.append(noteList["F3t"]!)
                level = 5
            case 6 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["F#4t"]!)
                level = 6
            case 7 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["Eb4t"]!)
                level = 7
            case 8 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["D5t"]!)
                noteArray.append(noteList["E5t"]!)
                noteArray.append(noteList["F5t"]!)
                level = 8
            case 9 :
                level = level-1
                noteArray = getNotes()
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

                level = 9

            default: break
            }
        case .BassClarinet :
                instrumentType = .Clarinet
                noteArray = getNotes()
                instrumentType = .BassClarinet
        
        case .AltoClarinet :
            println("Hauling an Alto Clarinet this time")
            switch level{
            case 1 :
                noteArray.append(noteList["D4t"]!)
                noteArray.append(noteList["C4t"]!)
                noteArray.append(noteList["B3t"]!)
            case 2 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["A3t"]!)
                noteArray.append(noteList["G3t"]!)
                level = 2
            case 3 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["E4t"]!)
                noteArray.append(noteList["F#3t"]!)
                level = 3
            case 4 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["E3t"]!)
                level = 4
            case 5 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["F3t"]!)
                noteArray.append(noteList["F4t"]!)
                noteArray.append(noteList["G4t"]!)
                level = 5
            case 6 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["C#4t"]!)
                noteArray.append(noteList["F#4t"]!)
                level = 6
            case 7 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["Bb3t"]!)
                level = 7
            case 8 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["A4t"]!)
                level = 8
            case 9 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["Eb4t"]!)
                noteArray.append(noteList["D#4t"]!)
                noteArray.append(noteList["A#3t"]!)
                level = 9
            default: break
            }
        case .TenorSaxophone :
            println("It's Tenor Sax Time!")
            switch level{
            case 1 :
                noteArray.append(noteList["E5t"]!)
                noteArray.append(noteList["F5t"]!)
                noteArray.append(noteList["G5t"]!)
                
            case 2 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["C5t"]!)
                noteArray.append(noteList["D5t"]!)
                level = 2
            case 3 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["A5t"]!)
                noteArray.append(noteList["B4t"]!)
                level = 3
            case 4 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["A4t"]!)
                noteArray.append(noteList["G4t"]!)
                level = 4
            case 5 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["Bb4t"]!)
                noteArray.append(noteList["Bb5t"]!)
                noteArray.append(noteList["C5t"]!)
                noteArray.append(noteList["F4t"]!)
                level = 5
            case 6 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["F#5t"]!)
                noteArray.append(noteList["B5t"]!)
                level = 6
            case 7 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["Eb5t"]!)
                noteArray.append(noteList["F#4t"]!)
                level = 7
            case 8 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["E4t"]!)
                noteArray.append(noteList["D4t"]!)
                level = 8
            case 9 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["C4t"]!)
                noteArray.append(noteList["Ab5t"]!)
                noteArray.append(noteList["G#5t"]!)
                noteArray.append(noteList["D#5t"]!)
                level = 9
                
            default: break
                
            }
        case .BaritoneTreble :
            println("It's a Baritone in Treble")
            switch level{
            case 1 :
                noteArray.append(noteList["E4t"]!)
                noteArray.append(noteList["F4t"]!)
                noteArray.append(noteList["G4t"]!)
                
            case 2 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["C4t"]!)
                noteArray.append(noteList["D4t"]!)
                level = 2
            case 3 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["A4t"]!)
                noteArray.append(noteList["B3t"]!)
                level = 3
            case 4 :
                level = level-1
                noteArray = getNotes()
                //noteArray.append(noteList["A3t"]!)
                level = 4
            case 5 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["Bb3t"]!)
                noteArray.append(noteList["Bb4t"]!)
                noteArray.append(noteList["C4t"]!)
                level = 5
            case 6 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["F#4t"]!)
                noteArray.append(noteList["B4t"]!)
                level = 6
            case 7 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["Eb4t"]!)
                level = 7
            case 8 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["D5t"]!)
                noteArray.append(noteList["Ab4t"]!)
                level = 8
            case 9 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["G#4t"]!)
                noteArray.append(noteList["D#4t"]!)
                level = 9
                
            default: break
                
            }
        case .Percussion :
            println("The Percussion in the back row")
                instrumentType = .Flute
                noteArray = getNotes()
                instrumentType = .Percussion
        case .BaritoneSaxophone :
            println("It's the Bari")
                instrumentType = .AltoSaxophone
                noteArray = getNotes()
                instrumentType = .BaritoneSaxophone
        default :
        println("No instrument selected")

        }
        
        return noteArray
    }
    
    var describe = "This is part of the Instrument Class"
    var instrumentType: Inst
    var level : Int
    
    
}