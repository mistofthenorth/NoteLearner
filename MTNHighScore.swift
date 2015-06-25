//
//  HighScore.swift
//  
//
//  Created by Brian M Owen on 6/18/15.
//
//

import Foundation
import CoreData
@objc(HighScore)
class HighScore: NSManagedObject {

    @NSManaged var dateOfScore: NSDate
    @NSManaged var instrument: String
    @NSManaged var level: NSNumber
    @NSManaged var score: NSNumber
    @NSManaged var scoreImage: NSData

}
