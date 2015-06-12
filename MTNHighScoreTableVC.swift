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

class highScoreTableView: UITableViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate{
    
    //@IBOutlet var tableView: UITableView!
    private var highScoreManagedObjectContext : NSManagedObjectContext?
    var fetchedScores: [HighScore]?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "highScoreCell")
        //Get the high scores from the Core Data Database
        let context = UIApplication.sharedApplication().delegate as! AppDelegate!
        highScoreManagedObjectContext = context.managedObjectContext
        let request = NSFetchRequest(entityName: "HighScore")
        self.fetchedScores = highScoreManagedObjectContext?.executeFetchRequest(request, error: NSErrorPointer()) as? [HighScore]
        println(fetchedScores)
        
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchedScores!.count
    }
    
override     
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("This is row # \(indexPath)")
        
        if (MFMailComposeViewController.canSendMail()){
            let mailComposer = MFMailComposeViewController()
            mailComposer.setSubject("A Score on NoteLearner was Recorded!")
            mailComposer.setMessageBody("A score of \(self.fetchedScores![indexPath.row].score) was recorded on Level \(self.fetchedScores![indexPath.row].level)", isHTML: false)
            let oneStars :NSData = UIImagePNGRepresentation(UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("oneStars", ofType: "png")!))
            let twoStars :NSData = UIImagePNGRepresentation(UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("twoStars", ofType: "png")!))
            let threeStars :NSData = UIImagePNGRepresentation(UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("threeStars", ofType: "png")!))

            let score: Int = Int(self.fetchedScores![indexPath.row].score)
            
            if score<600{mailComposer.addAttachmentData(oneStars, mimeType: "image/png", fileName: "oneStars")}
            else if score<1200{mailComposer.addAttachmentData(twoStars, mimeType: "image/png", fileName: "twoStars")}
            else {mailComposer.addAttachmentData(threeStars, mimeType: "image/png", fileName: "threeStars")}
            
            
            mailComposer.mailComposeDelegate = self
            self.presentViewController(mailComposer, animated: true, completion: nil)
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let threeStars = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("threeStars", ofType: "png")!)
        let twoStars = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("twoStars", ofType: "png")!)
        let oneStars = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("oneStars", ofType: "png")!)


        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        let score: Int = Int(self.fetchedScores![indexPath.row].score)
        if score<600{cell.imageView?.image = oneStars}
        else if score<1200{cell.imageView?.image = twoStars}
        else {cell.imageView?.image = threeStars}
        
        cell.textLabel?.text = "\(self.fetchedScores![indexPath.row].instrument) \(self.fetchedScores![indexPath.row].score)"
        cell.detailTextLabel?.text = "Level \(self.fetchedScores![indexPath.row].level)"
        
        
        return cell
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
