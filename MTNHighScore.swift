//
//  HighScore.swift
//  
//
//  Created by Brian M Owen on 5/28/15.
//
//

import Foundation
import CoreData
//The next line is a fix recommendd by a stack overflow answer. Otherwise the data stack can't find this class
@objc(HighScore)
class HighScore: NSManagedObject {

    @NSManaged var level: NSNumber
    @NSManaged var score: NSNumber
    @NSManaged var instrument: String
    @NSManaged var dateOfScore: NSDate

}
