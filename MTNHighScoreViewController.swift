//
//  MTNHighScoreViewController.swift
//  NoteLearner
//
//  Created by Brian M Owen on 5/29/15.
//  Copyright (c) 2015 Brian Owen. All rights reserved.
//

import UIKit
import CoreData

class HighScoreViewController: UIViewController {
    
    private var highScoreManagedObjectContext : NSManagedObjectContext?
    private var scoresString : String = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        highScoreLabel.text = "You have no High Scores"
        let context = UIApplication.sharedApplication().delegate as! AppDelegate!
        highScoreManagedObjectContext = context.managedObjectContext
        let request = NSFetchRequest(entityName: "HighScore")
        let fetchedObject = highScoreManagedObjectContext?.executeFetchRequest(request, error: NSErrorPointer())
        
        //println(fetchedObject?.count)
        
    //Iterate through the fetched objects and add them to the high score label
        
        for var i=0 ; i<fetchedObject!.count; ++i{
            var newScore = fetchedObject![i] as! HighScore
            scoresString = scoresString + "\(newScore.instrument) - Level = \(newScore.level) - Score - \(newScore.score) \n"
            highScoreLabel.text = scoresString
            println(highScoreLabel.text)
        }
    }
    
    
    @IBOutlet weak var highScoreLabel: UILabel!

    
}