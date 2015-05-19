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
        case "Trombone" : instrumentType = .Trombone
        case "Baritone Bass" : instrumentType = .BaritoneBass
        case "Bassoon" : instrumentType = .Bassoon
        case "Electric Bass" : instrumentType = .ElectricBass
        case "Tuba" : instrumentType = .Tuba
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
        case .Trombone :
            println("It's a Trombone!")
            switch level{
                case 1 :
                    noteArray.append(noteList["F3b"]!)
                    noteArray.append(noteList["Eb3b"]!)
                    noteArray.append(noteList["D3b"]!)
                    
                case 2 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["C3b"]!)
                    noteArray.append(noteList["Bb2b"]!)
                    level = 2
                case 3 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["G3b"]!)
                    noteArray.append(noteList["A2b"]!)
                    level = 3
                case 4 :
                    level = level-1
                    noteArray = getNotes()
                    level = 4
                case 5 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["Ab2b"]!)
                    noteArray.append(noteList["Ab3b"]!)
                    noteArray.append(noteList["Bb3b"]!)
                    level = 5
                case 6 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["A3b"]!)
                    level = 6
                case 7 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["Db3b"]!)
                    level = 7
                case 8 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["C4b"]!)
                    level = 8
                case 9 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["Gb3b"]!)
                    noteArray.append(noteList["F#3b"]!)
                    noteArray.append(noteList["C#3b"]!)

                    level = 9
                    
                default: break
                
            }
        case .Trombone :
            println("It's a Trombone!")
            switch level{
            case 1 :
                noteArray.append(noteList["F3b"]!)
                noteArray.append(noteList["Eb3b"]!)
                noteArray.append(noteList["D3b"]!)
                
            case 2 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["C3b"]!)
                noteArray.append(noteList["Bb2b"]!)
                level = 2
            case 3 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["G3b"]!)
                noteArray.append(noteList["A2b"]!)
                level = 3
            case 4 :
                level = level-1
                noteArray = getNotes()
                level = 4
            case 5 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["Ab2b"]!)
                noteArray.append(noteList["Ab3b"]!)
                noteArray.append(noteList["Bb3b"]!)
                level = 5
            case 6 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["A3b"]!)
                level = 6
            case 7 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["Db3b"]!)
                level = 7
            case 8 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["C4b"]!)
                level = 8
            case 9 :
                level = level-1
                noteArray = getNotes()
                noteArray.append(noteList["Gb3b"]!)
                noteArray.append(noteList["F#3b"]!)
                noteArray.append(noteList["C#3b"]!)
                
                level = 9
                
            default: break
                
            }

        case .Tuba :
            println("It's a Tuba!")
            switch level{
                case 1 :
                    noteArray.append(noteList["F2b"]!)
                    noteArray.append(noteList["Eb2b"]!)
                    noteArray.append(noteList["D2b"]!)
                    
                case 2 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["C2b"]!)
                    noteArray.append(noteList["Bb1b"]!)
                    level = 2
                case 3 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["G2b"]!)
                    noteArray.append(noteList["A1b"]!)
                    level = 3
                case 4 :
                    level = level-1
                    noteArray = getNotes()
                    level = 4
                case 5 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["Ab1b"]!)
                    noteArray.append(noteList["Ab2b"]!)
                    noteArray.append(noteList["Bb2b"]!)
                    level = 5
                case 6 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["E2b"]!)
                    noteArray.append(noteList["A2b"]!)

                    level = 6
                case 7 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["Db2b"]!)
                    level = 7
                case 8 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["C3b"]!)
                    level = 8
                case 9 :
                    level = level-1
                    noteArray = getNotes()
                    noteArray.append(noteList["Gb2b"]!)
                    noteArray.append(noteList["F#2b"]!)
                    noteArray.append(noteList["C#2b"]!)
                    
                    level = 9
                    
                default: break
                
            }
        case .BaritoneBass :
            println("Gotcha a bass clef Baritone")
                instrumentType = .Trombone
                noteArray = getNotes()
                instrumentType = .BaritoneBass
        case .Bassoon :
            println("Gotcha a Bassoon")
                instrumentType = .Trombone
                noteArray = getNotes()
                instrumentType = .Bassoon
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