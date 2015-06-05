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
        self.instrumentType = Instrument(instrument: instrument, setLevel: whichLevel!)

    }
    
    func note() -> NoteView?{

            let noteChoices = self.instrumentType?.getNotes()
            println("The array has \(noteChoices?.count) notes")
            println(self.instrumentType?.level)
            let noteNumber = Int(arc4random_uniform(UInt32(noteChoices!.count)))
            println(noteChoices?[noteNumber].noteName)
            return noteChoices?[noteNumber]
    
    }
    
    func getGravityMagnitude() -> CGFloat{
        //Notes move faster at the higher levels
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            let gravityDouble = Double(whichLevel!)*0.02 + 0.1
            return CGFloat(gravityDouble)
        }
        else {
            let gravityDouble = Double(whichLevel!)*0.011 + 0.05
            return CGFloat(gravityDouble)
        }
        
    }
    
    func getNoteCreationTimeInterval() -> NSTimeInterval{
        //Returns the amount of time between notes. This is necessary to compensate for the gravity magnitude change based on level
        switch whichLevel!{
        case 1...3: return 7
        case 4...6: return 6
        case 7...9: return 5
        default: return 4
        }
    }
    
    func getScoreForNote(elapsedTime: CFTimeInterval) -> Int{
        //Calculates a score out of 100 based on the amount of time it takes to select the note
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {

                switch whichLevel!{
                case 1...3: if (elapsedTime < 2){return 100}
                    else {return Int((elapsedTime-7)*(-20))}
                    
                case 4...6: if (elapsedTime < 1.8){return 100}
                    else {return Int((elapsedTime-6)*(-23.8))}
                    
                case 7...9: if (elapsedTime < 1.6){return 100}
                    else {return Int((elapsedTime-5)*(-29.4))}
                default: return 0
            }
        }
        else{
                switch whichLevel!{
                case 1...3: if (elapsedTime < 2.6){return 100}
                else {return Int((elapsedTime-6)*(-29.4))}
                    
                case 4...6: if (elapsedTime < 2.3){return 100}
                else {return Int((elapsedTime-5)*(-37))}
                    
                case 7...9: if (elapsedTime < 1.8){return 100}
                else {return Int((elapsedTime-4)*(-45))}
                default: return 0
                }
            }
        }
    }
    
