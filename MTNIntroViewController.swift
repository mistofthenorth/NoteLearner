//
//  MTNIntroViewController.swift
//  NoteLearner
//
//  Created by Brian M Owen on 6/17/15.
//  Copyright (c) 2015 Brian Owen. All rights reserved.
//

import UIKit

class MTNIntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
        let backgroundImage = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("introViewBackground", ofType: "png")!)
        view.backgroundColor = UIColor(patternImage: backgroundImage!)
        }
        else{
            let backgroundImage = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("iPhoneIntroViewBackgroundSolid", ofType: "png")!)
            view.backgroundColor = UIColor(patternImage: backgroundImage!)
        }
        startButton.enabled = false
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func userChangedLevel(sender: UIStepper) {
        //println("The User has Changed the Level to  \(sender.value)")
        let newLevelValue : Int = Int(sender.value)
        levelChooserLabel.text = "Level \(newLevelValue)"
    }
    
    @IBAction func userChangedInstrument(sender: UIStepper) {
        ////println("The User has Changed the Instrument to ")
        startButton.enabled = true
        switch sender.value {
        case 1: instrumentChooserLabel?.text = "Baritone Treble"
        case 2: instrumentChooserLabel?.text = "Trumpet"
        case 3: instrumentChooserLabel?.text = "Alto Saxophone"
        case 4: instrumentChooserLabel?.text = "Tenor Saxophone"
        case 5: instrumentChooserLabel?.text = "Baritone Saxophone"
        case 6: instrumentChooserLabel?.text = "Flute"
        case 7: instrumentChooserLabel?.text = "Oboe"
        case 8: instrumentChooserLabel?.text = "Clarinet"
        case 9: instrumentChooserLabel?.text = "Bass Clarinet"
        case 10: instrumentChooserLabel?.text = "Alto Clarinet"
        case 11: instrumentChooserLabel?.text = "Percussion"
        case 12: instrumentChooserLabel?.text = "French Horn"
        case 13: instrumentChooserLabel?.text = "Trombone"
        case 14: instrumentChooserLabel?.text = "Baritone Bass"
        case 15: instrumentChooserLabel?.text = "Bassoon"
        case 16: instrumentChooserLabel?.text = "Electric Bass"
        case 17: instrumentChooserLabel?.text = "Tuba"
        default: break
        }
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.destinationViewController.isKindOfClass(GameViewController)){
            //println("This is a segue to the gameview")
            let gameView = segue.destinationViewController as! GameViewController
            gameView.gameLevel = Int(levelChooserStepper.value)
            gameView.gameInstrumentChoice = instrumentChooserLabel!.text!
            //println(levelChooserStepper.value)
        //segue.destinationViewController.gameLevel = levelChooserStepper.value
        ////println(sender?.description)
        ////println(levelChooserLabel?.text)
        //println("This occurs during the segue")
        }
    }
    
    @IBOutlet weak var startButton: UIButton!
    @IBAction func unwindToIntroVC(segue: UIStoryboardSegue) {
        //This method is called when the High Score board is unwound to the view controller
    }

    @IBOutlet weak var levelChooserStepper: UIStepper!
    @IBOutlet weak var levelChooserLabel: UILabel!
    @IBOutlet weak var instrumentChooserStepper: UIStepper!
    @IBOutlet weak var instrumentChooserLabel: UILabel!
}
