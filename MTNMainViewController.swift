//
//  ViewController.swift
//  NoteLearner
//
//  Created by Brian M Owen on 3/25/15.
//  Copyright (c) 2015 Brian Owen. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        gravity.magnitude = 0.2
        gravity.angle = 3.142
        startButton.hidden = true
        
        setButtonLayout()
//        levelChooserStepper?.stepValue = 1.0
//        println(levelChooserStepper?.value)
        let standardDefaults = NSUserDefaults.standardUserDefaults()
        println(standardDefaults.valueForKey("Latest High Score"))
        
//        let entity = NSEntityDescription.entityForName("HighScore", inManagedObjectContext: viewControllersManagedObjectContext!)
//        let fakeHighScore = HighScore(entity: entity!, insertIntoManagedObjectContext: viewControllersManagedObjectContext!)
//        fakeHighScore.level = 1
//        fakeHighScore.instrument = "Trumpet"
//        fakeHighScore.score = 490
//        fakeHighScore.dateOfScore = NSDate()
//        
//        let check = viewControllersManagedObjectContext?.save(NSErrorPointer())
//        println(check)
//        println(fakeHighScore)
        
//        let request = NSFetchRequest(entityName: "HighScore")
//        let fetchedObject = viewControllersManagedObjectContext?.executeFetchRequest(request, error: NSErrorPointer())
//        println(fetchedObject)
        
        
    
    }

    override func viewDidAppear(animated: Bool) {
        animator.addBehavior(gravity)

    }
    @IBAction func userChangedLevel(sender: UIStepper) {
        println("The User has Changed the Level to  \(sender.value)")
        let newLevelValue : Int = Int(sender.value)
        levelChooserLabel.text = "Level \(newLevelValue)"
    }

    @IBAction func userChangedInstrument(sender: UIStepper) {
        println("The User has Changed the Instrument to ")
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
        case 12: instrumentChooserLabel?.text = "Trombone"
        case 13: instrumentChooserLabel?.text = "Baritone Bass"
        case 14: instrumentChooserLabel?.text = "Bassoon"
        case 15: instrumentChooserLabel?.text = "Electric Bass"
        case 16: instrumentChooserLabel?.text = "Tuba"
        default: break
        }
        startButton.hidden = false
    }
    
    
    func setButtonLayout(){
        buttonA.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonB.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonC.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonD.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonE.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonF.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonG.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonFsharp.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonGsharp.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonAsharp.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonCsharp.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonDsharp.setTranslatesAutoresizingMaskIntoConstraints(false)

        
        let viewsDictionary = ["buttonA":buttonA, "buttonB":buttonB, "buttonC":buttonC, "buttonD":buttonD, "buttonE":buttonE, "buttonF":buttonF, "buttonG":buttonG]
        let sharpsAndFlatsDictionary = ["buttonCsharp":buttonCsharp, "buttonDsharp":buttonDsharp,"buttonFsharp" :buttonFsharp, "buttonGsharp":buttonGsharp, "buttonAsharp":buttonAsharp]

        
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            println("Check it out, new code for iPhone only")
            let buttonRowConstraint:Array = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[buttonC(==buttonD)]-[buttonD(==buttonC)]-[buttonE(==buttonC)]-[buttonF(==buttonC)]-[buttonG(==buttonC)]-[buttonA(==buttonC)]-[buttonB(==buttonC)]-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
            let sharpsAndFlatsConstraint:Array = NSLayoutConstraint.constraintsWithVisualFormat("H:|-45-[buttonCsharp]-[buttonDsharp(==buttonCsharp)]-35-[buttonFsharp(==buttonCsharp)]-[buttonGsharp(==buttonCsharp)]-[buttonAsharp(==buttonCsharp)]-35-|", options: NSLayoutFormatOptions(0), metrics: nil, views: sharpsAndFlatsDictionary)
            
            view.addConstraints(sharpsAndFlatsConstraint)
            view.addConstraints(buttonRowConstraint)
            
        }
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            let buttonRowConstraint:Array = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[buttonC(==buttonD)]-[buttonD(==buttonC)]-[buttonE(==buttonC)]-[buttonF(==buttonC)]-[buttonG(==buttonC)]-[buttonA(==buttonC)]-[buttonB(==buttonC)]-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
            let sharpsAndFlatsConstraint:Array = NSLayoutConstraint.constraintsWithVisualFormat("H:|-65-[buttonCsharp]-[buttonDsharp(==buttonCsharp)]-90-[buttonFsharp(==buttonCsharp)]-[buttonGsharp(==buttonCsharp)]-[buttonAsharp(==buttonCsharp)]-65-|", options: NSLayoutFormatOptions(0), metrics: nil, views: sharpsAndFlatsDictionary)
            
            view.addConstraints(sharpsAndFlatsConstraint)
            view.addConstraints(buttonRowConstraint)
        
        }
    
        
    }

    
    func randomChooser(){
        noteScoreInt++
        noteScore.text = "\(noteScoreInt)/15 \n"
        
        latestNoteView?.removeFromSuperview()
        var getNewNote = currentGameManager?.note()

        latestNoteView = getNewNote
        let yPosition = arc4random_uniform(UInt32(CGRectGetMaxY(gameView.bounds)-120))
        println(yPosition)
        latestNoteView.frame = CGRectMake(CGRectGetMaxX(gameView.frame)-1, CGFloat(yPosition), 257, 120)
        gameView.addSubview(latestNoteView)
        gravity.addItem(latestNoteView)
        startTime = CFAbsoluteTimeGetCurrent()
        
        // your long procedure
        
        if (noteScoreInt < 15){
            var aDelay = NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector:Selector("randomChooser"), userInfo: nil, repeats: false)
            }
        if (noteScoreInt == 15){
            var aDelay = NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector:Selector("newLevel"), userInfo: nil, repeats: false)
            }

        }

    
    
    func saveScore(){
        let context = UIApplication.sharedApplication().delegate as! AppDelegate!
        let highScoreManagedObjectContext = context.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("HighScore", inManagedObjectContext: highScoreManagedObjectContext!)
        let newHighScore = HighScore(entity: entity!, insertIntoManagedObjectContext: highScoreManagedObjectContext!)
        newHighScore.level = currentGameManager!.instrumentType!.level
        newHighScore.instrument = currentGameManager!.instrumentType!.instrumentType.rawValue
        newHighScore.score = pointsInt
        newHighScore.dateOfScore = NSDate()
        
        let check = highScoreManagedObjectContext!.save(NSErrorPointer())
        println(check)
    
    
    }
    
    func removeViewWithTap(viewToRemove: UIView){
        if currentTapGesture?.state == UIGestureRecognizerState.Ended{
            viewToRemove.removeFromSuperview()
            }
        println("The recognizer is running the method removeViewWithTap")
        }
    
    func handleTap(recognizer: UIGestureRecognizer){
        println("Nice Tap bro")
        levelCompleteScoreView?.removeFromSuperview()
        
    
    }
    
    func newLevel(){

        saveScore()
        
        levelCompleteScoreView = UIView(frame: mainView.frame)
        var xFloat: CGFloat = CGRectGetMaxX(gameView.frame)/2
        var yFloat: CGFloat = CGRectGetMaxY(gameView.frame)/2
        levelCompleteScoreView?.center = CGPoint(x: xFloat, y: yFloat)
        levelCompleteScoreView?.backgroundColor = UIColor(white: 200, alpha: 0.8)
        
        currentTapGesture = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        currentTapGesture?.delegate = self
        levelCompleteScoreView?.addGestureRecognizer(currentTapGesture!)
        
        gameView.addSubview(levelCompleteScoreView!)
        
        betweenLevelTextLabel = UILabel(frame: CGRectMake(0, 0, 200, 21))
        xFloat = CGRectGetMaxX(gameView.frame)/2
        yFloat = CGRectGetMaxY(gameView.frame)/2
        betweenLevelTextLabel?.center = CGPointMake(xFloat,yFloat)
        betweenLevelTextLabel?.textAlignment = NSTextAlignment.Center
        betweenLevelTextLabel?.text = "You got \(pointsInt) points!"
        levelCompleteScoreView?.addSubview(betweenLevelTextLabel!)
        
        
        levelChooserLabel.hidden = false
        levelChooserStepper.hidden = false
        instrumentChooserStepper.hidden = false
        instrumentChooserLabel.hidden = false
        startButton.hidden = false
        
    }
    
    
    func startMoving(){
//      Use this function for code after pushing start
        
        noteScoreInt = 0
        //betweenLevelTextLabel?.removeFromSuperview()
        startButton.hidden = true
        mainView.alpha = 1

    }
    //The next three functions check for the correct note according to an int representing each note
    func addPoints(){
        endTime = CFAbsoluteTimeGetCurrent()
        let elapsedTime = endTime! - startTime!

        if elapsedTime < 2{
            pointsInt += 100
        }
        
        if elapsedTime>2 && elapsedTime<2.5 {
            pointsInt += 80
        }
        if elapsedTime>2.5 && elapsedTime<3 {
            pointsInt += 60
        }
        if elapsedTime>3 && elapsedTime<3.5 {
            pointsInt += 40
        }
        if elapsedTime>3.5 {
            pointsInt += 20
        }
        
        
        
        //pointsInt += 100
        numberOfPoints.text = String(pointsInt)


        //println("runtime is nanosecs : \(endTime! - startTime!)")
    }
    func subtractPoints(){
        pointsInt += -50
        numberOfPoints.text = String(pointsInt)
    }
    func checkForCorrectNote (intRepresentingNote: Int){
        if (latestNoteView?.window != nil){
            if latestNoteView?.noteName == intRepresentingNote{
                addPoints()
                latestNoteView.removeFromSuperview()
            }
            else
            {
                subtractPoints()
            }
        }
        else
        {
            subtractPoints()
        }
    
    }
    
    @IBAction func newNote() {
        startMoving()
        chooseInstrument()
        randomChooser()
    }
    
    func chooseInstrument() {
        
        self.currentGameManager = GameManager(levelNumber: Int(levelChooserStepper.value), instrument: (instrumentChooserLabel.text)!)
        //startButton.hidden = false
        //trumpetButton.removeFromSuperview()
        //altoButton.removeFromSuperview()
        levelChooserStepper.hidden = true
        levelChooserLabel.hidden = true
        instrumentChooserLabel.hidden = true
        instrumentChooserStepper.hidden = true
        
        currentLevelLabel.text = "Level \(Int(levelChooserStepper.value))" + " - \((instrumentChooserLabel.text)!)"
    }

    
    @IBAction func touchNoteName(sender: AnyObject) {
        let noteName = sender.currentTitle!
        println(sender.currentTitle!)
        
        
        switch noteName!{
        case "C" : checkForCorrectNote(1)
        case "C#/Db" :checkForCorrectNote(2)
        case "D" : checkForCorrectNote(3)
        case "D#/Eb" : checkForCorrectNote(4)
        case "E" : checkForCorrectNote(5)
        case "F" : checkForCorrectNote(6)
        case "F#/Gb" : checkForCorrectNote(7)
        case "G" : checkForCorrectNote(8)
        case "G#/Ab" : checkForCorrectNote(9)
        case "A" : checkForCorrectNote(10)
        case "A#/Bb" : checkForCorrectNote(11)
        case "B" :checkForCorrectNote(12)
        default: break
        }
        
    }
    
    @IBAction func unwindToMainVC(segue: UIStoryboardSegue) {
        
    }
    
    lazy var animator: UIDynamicAnimator = {let lazilyCreatedUIDynamicAnimator = UIDynamicAnimator(referenceView: self.mainView)
        return lazilyCreatedUIDynamicAnimator
        }()
    var pointsInt: Int = 0
    var noteScoreInt: Int = 0
    var currentGameManager: GameManager? = nil
    var betweenLevelTextLabel : UILabel?
    var currentTapGesture = UIGestureRecognizer?()
    let gravity = UIGravityBehavior()
    weak var latestNoteView: NoteView!
    
    var levelCompleteScoreView : UIView?

    var startTime : CFAbsoluteTime?
    var endTime: CFAbsoluteTime?
    
    
    @IBOutlet weak var noteScore: UILabel!
    @IBOutlet weak var trumpetButton: UIButton!
    @IBOutlet weak var altoButton: UIButton!
    @IBOutlet weak var numberOfPoints: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var currentLevelLabel: UILabel!
    
    @IBOutlet weak var levelChooserLabel: UILabel!
    @IBOutlet weak var levelChooserStepper: UIStepper!
    @IBOutlet weak var instrumentChooserStepper: UIStepper!
    @IBOutlet weak var instrumentChooserLabel: UILabel!
    
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var buttonE: UIButton!
    @IBOutlet weak var buttonF: UIButton!
    @IBOutlet weak var buttonG: UIButton!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonFsharp: UIButton!
    @IBOutlet weak var buttonCsharp: UIButton!
    @IBOutlet weak var buttonDsharp: UIButton!
    @IBOutlet weak var buttonAsharp: UIButton!
    @IBOutlet weak var buttonGsharp: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
    

}

