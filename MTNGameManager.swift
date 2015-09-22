//
//  MTNLevel.swift
//  NoteLearner
//
//  Created by Brian M Owen on 4/6/15.
//  Copyright (c) 2015 Brian Owen. All rights reserved.
//
//  The Game Manager is instantiated at the during the GameViewController's initialization. It is in charge of elements that change based on the level or instrument. It is in charge of returning appropriate note choices and scoring them.

import UIKit

class GameManager{

    let whichLevel : Int?
    var instrumentType : Instrument? = nil
    var sortedNoteChoicesArray : [NoteView]?
    var newNotesOnlyArray : [NoteView]?
    
    init(levelNumber: Int, instrument: String)
    {
        self.whichLevel = levelNumber
        self.instrumentType = Instrument(instrument: instrument, setLevel: whichLevel!)
        setupNotelistArrayForGame()
    }
        //Borrowed from Stack Overflow - Fisher-Yates Shuffle
    func shuffle<C: MutableCollectionType where C.Index == Int>(var list: C) -> C {
        //TODO - check the shuffle
        let c = list.count
        for i in 0..<(c - 1) {
            let j = Int(arc4random_uniform(UInt32(c - i))) + i
            //Next line is added to avoid swapping the same item
            //TODO - verify accuracy
            if (i != j)
                {swap(&list[i], &list[j])}
        }
        return list
    }
    
    func setupNotelistArrayForGame() {
        //Get an array of possible notes for the level, could be 3, or upwards of 20
        let noteChoicesTuple = instrumentType!.getNotes()
        let noteChoices : [NoteView] = noteChoicesTuple.allNotesForGame
        newNotesOnlyArray = noteChoicesTuple.newNotesOnly
        //Create a new array and append the notes to it
        sortedNoteChoicesArray = [NoteView]()
        for notes in noteChoices{
            sortedNoteChoicesArray?.append(notes)
        }
        //Repeat this process if there are less than 15 notes. This is a defensive copying technique to avoid pass by reference
        while(sortedNoteChoicesArray?.count<15)
        {
            let moreNoteChoicesTuple = instrumentType!.getNotes()
            let moreNoteChoices = moreNoteChoicesTuple.allNotesForGame
            for notes in moreNoteChoices{
                sortedNoteChoicesArray?.append(notes)
            }
        }
        
        //Shuffle is a Fisher-Yates shuffle implementation to randomize which notes appear in which order
        sortedNoteChoicesArray = shuffle(sortedNoteChoicesArray!)
        
        //Uncomment the following line to see what the array of notes is based on the integer representing a note (1-12)
        /*
        for i in sortedNoteChoicesArray!{
        println(i.noteName)
        }
        */
    }
    
    func note() -> NoteView{
        
            let returningNoteView = sortedNoteChoicesArray!.last
            sortedNoteChoicesArray?.removeLast()
            return returningNoteView!
    
    }
    
    func getGravityMagnitude() -> CGFloat{
        //Notes move faster at the higher levels
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            let gravityDouble = Double(whichLevel!)*0.02 + 0.08
            return CGFloat(gravityDouble)
        }
        else {
            let gravityDouble = Double(whichLevel!)*0.011 + 0.06
            return CGFloat(gravityDouble)
        }
        
    }
    
    func getNoteCreationTimeInterval() -> NSTimeInterval{
        //This method is no longer in use. Note creation is based on when the user presses the correct note button
        //Returns the amount of time between notes. This is necessary to compensate for the gravity magnitude change based on level
        switch whichLevel!{
        case 1...3: return 7
        case 4...6: return 6
        case 7...9: return 5
        default: return 4
        }
    }
    
    func getScoreForNote(maximumX: CGFloat, currentX: CGFloat) -> Int{
        if(currentX/maximumX > 0.85){
            return 100
        }
        else{
            var score = ((((currentX)/(maximumX))*100)/0.85)
            if score<0{score = 1}
            return Int(score)
        }
        //Calculates a score out of 100 based on the amount of time it takes to select the note
//        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
//
//                switch whichLevel!{
//                case 1...3: if (elapsedTime < 2){return 100}
//                    else {return Int((elapsedTime-7)*(-20))}
//                    
//                case 4...6: if (elapsedTime < 1.8){return 100}
//                    else {return Int((elapsedTime-6)*(-23.8))}
//                    
//                case 7...9: if (elapsedTime < 1.6){return 100}
//                    else {return Int((elapsedTime-5)*(-29.4))}
//                default: return 0
//            }
//        }
//        else{
//                switch whichLevel!{
//                case 1...3: if (elapsedTime < 2.6){return 100}
//                else {return Int((elapsedTime-6)*(-29.4))}
//                    
//                case 4...6: if (elapsedTime < 2.3){return 100}
//                else {return Int((elapsedTime-5)*(-37))}
//                    
//                case 7...9: if (elapsedTime < 1.8){return 100}
//                else {return Int((elapsedTime-4)*(-45))}
//                default: return 0
//                }
//            }
        
        

       }
    }
    
