//
//  MTNHighScoreTableVC.swift
//  NoteLearner
//
//  Created by Brian M Owen on 6/9/15.
//  Copyright (c) 2015 Brian Owen. All rights reserved.
//


import UIKit
import CoreData
import MessageUI

class highScoreTableView: UITableViewController, MFMailComposeViewControllerDelegate{
    
    private var highScoreManagedObjectContext : NSManagedObjectContext?
    var fetchedScores: [HighScore]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get the high scores from the Core Data Database
        let context = UIApplication.sharedApplication().delegate as! AppDelegate!
        highScoreManagedObjectContext = context.managedObjectContext
        let request = NSFetchRequest(entityName: "HighScore")
        
        //Create a sort so the most recent items are at the top
        let sortOrderByMostRecent = NSSortDescriptor(key: "dateOfScore", ascending: false)
        let sortOrderByMostRecentArray = [sortOrderByMostRecent]
        request.sortDescriptors = sortOrderByMostRecentArray

        //Set the array of HighScore objects to a property for use latter
        
        do{
            try self.fetchedScores = highScoreManagedObjectContext?.executeFetchRequest(request) as? [HighScore]
        } catch{
            print("Error getting the High Score Object")
        }
        
        //self.fetchedScores = highScoreManagedObjectContext?.executeFetchRequest(request) as? [HighScore]
        print(fetchedScores)
        
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchedScores!.count
    }
    
override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("This is row # \(indexPath)")
        
        if (MFMailComposeViewController.canSendMail()){
            
            let mailComposer = MFMailComposeViewController()
            mailComposer.setSubject("A Score on Band Note Learner was Recorded!")
            mailComposer.setMessageBody("A score of \(self.fetchedScores![indexPath.row].score) was recorded on \(self.fetchedScores![indexPath.row].instrument) Level - \(self.fetchedScores![indexPath.row].level)", isHTML: false)
            mailComposer.addAttachmentData(self.fetchedScores![indexPath.row].scoreImage, mimeType: "jpg", fileName: "\(self.fetchedScores![indexPath.row].score)NoteLearner.jpg")
            
            mailComposer.mailComposeDelegate = self
            
            self.presentViewController(mailComposer, animated: true, completion: nil)

        }
        else{
            //Warn the user if mail is not available
            //let alert = UIAlertView(title: "Mail Error", message: "Mail features are not available on this device", delegate: nil, cancelButtonTitle: "OK")
            let alertController = UIAlertController(title: "Mail Error", message: "Mail features are not available on this device.", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // ...
            }
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true) {
                // ...
            }

            //alert.show()
        }
    
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let threeStars = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("threeStars", ofType: "png")!)
        let twoStars = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("twoStars", ofType: "png")!)
        let oneStars = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("oneStars", ofType: "png")!)


        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")!
        let score: Int = Int(self.fetchedScores![indexPath.row].score)
        if score<600{cell.imageView?.image = oneStars}
        else if score<1200{cell.imageView?.image = twoStars}
        else {cell.imageView?.image = threeStars}
        
        cell.textLabel?.text = "Level \(self.fetchedScores![indexPath.row].level) - \(self.fetchedScores![indexPath.row].score)"
        cell.detailTextLabel?.text = "\(self.fetchedScores![indexPath.row].instrument)"

        let imageMail = UIImageView(image: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("emailThumbnail", ofType: "png")!))
        cell.accessoryView = imageMail

        
        
        
        return cell
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
