//
//  ViewController.swift
//  NoteLearner
//
//  Created by Brian M Owen on 3/25/15.
//  Copyright (c) 2015 Brian Owen. All rights reserved.
//

import UIKit
import CoreData

class GameViewController: UIViewController, UIGestureRecognizerDelegate {

    lazy var animator: UIDynamicAnimator = {let lazilyCreatedUIDynamicAnimator = UIDynamicAnimator(referenceView: self.gameView)
        return lazilyCreatedUIDynamicAnimator
        }()
    lazy var collisions: UICollisionBehavior = {let collider = UICollisionBehavior();collider.translatesReferenceBoundsIntoBoundary = true; return collider}()
    var pointsInt: Int = 0
    var noteScoreInt: Int = 0
    var currentGameManager: GameManager? = nil
    var betweenLevelTextLabel : UILabel?
    var currentTapGesture = UIGestureRecognizer?()
    let gravity = UIGravityBehavior()
    var latestNoteView: NoteView?
    var levelCompleteScoreView : UIView?
    var iphoneGameViewScale : CGFloat = 1
    var gameLevel : Int = 1
    var gameInstrumentChoice : String = "Trumpet"
    var screenShotScore : NSData?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set the background image
        var backgroundImage = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("616x540threeBlankStaves", ofType: "png")!)!
        gameView.backgroundColor = UIColor(patternImage: backgroundImage)
        //Add the view constraints and button styles
        setButtonLayout()
        setButtonStyles()
        //Set a different background for iPhone, only one stave
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            let backgroundImage = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("blankStaff", ofType: "png")!)
            iPhoneStaff.image = backgroundImage
    
        }

        //println(currentGameManager!.getNoteCreationTimeInterval())
        

    }
    
    override func viewDidLayoutSubviews() {
        //Use this function for test code only
        
        //println(gameView.bounds.maxY)
        //println(iphoneGameViewScale)
            
        }

    
    override func viewDidAppear(animated: Bool) {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            iphoneGameViewScale = CGFloat(gameView.bounds.maxY/188)
        }
        
        //Set up the GameManager with the appropriate instrument and level choice from the intro view
        chooseInstrument()
        //Start the gravity and update the label text
        startMoving()
        
        animator.addBehavior(gravity)
        animator.addBehavior(collisions)
        
        addNewNoteToView()


    }
    @IBAction func userChangedLevel(sender: UIStepper) {
        //println("The User has Changed the Level to  \(sender.value)")
        let newLevelValue : Int = Int(sender.value)
        levelChooserLabel.text = "Level \(newLevelValue)"
    }

    @IBAction func userChangedInstrument(sender: UIStepper) {
        //println("The User has Changed the Instrument to ")
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
        //startButton.hidden = false
    }
    func setButtonStyles(){
        var radius = CGFloat(20)
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
         radius = CGFloat(30)
        }
        buttonA.layer.cornerRadius = radius
        buttonB.layer.cornerRadius = radius
        buttonC.layer.cornerRadius = radius
        buttonD.layer.cornerRadius = radius
        buttonE.layer.cornerRadius = radius
        buttonF.layer.cornerRadius = radius
        buttonG.layer.cornerRadius = radius
        buttonAsharp.layer.cornerRadius = radius
        buttonCsharp.layer.cornerRadius = radius
        buttonDsharp.layer.cornerRadius = radius
        buttonFsharp.layer.cornerRadius = radius
        buttonGsharp.layer.cornerRadius = radius
    
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
            //println("New code for iPhone only")
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
    
    
    func saveScore(){
        //Get Core Data Context
        let context = UIApplication.sharedApplication().delegate as! AppDelegate!
        let highScoreManagedObjectContext = context.managedObjectContext
        //Create entity
        let entity = NSEntityDescription.entityForName("HighScore", inManagedObjectContext: highScoreManagedObjectContext!)
        let newHighScore = HighScore(entity: entity!, insertIntoManagedObjectContext: highScoreManagedObjectContext!)
        
        //Set Values for the new object
        newHighScore.level = currentGameManager!.instrumentType!.level
        newHighScore.instrument = currentGameManager!.instrumentType!.instrumentType.rawValue
        newHighScore.score = pointsInt
        newHighScore.scoreImage = screenShotScore!
        newHighScore.dateOfScore = NSDate()
        
        //Save the context and print true if the save worked
        let check = highScoreManagedObjectContext!.save(NSErrorPointer())
        //println("High Score Saved = \(check)")
    
    
    }
    
    
    func handleTap(recognizer: UIGestureRecognizer){
        //println("User has tapped")
        levelCompleteScoreView?.removeFromSuperview()
        mainView.alpha = 1
        self.performSegueWithIdentifier("unwindToIntroVC", sender: self)
    }
    
    func newLevel(){

        
        //Create new view for displaying score to the user
        
        levelCompleteScoreView = UIView(frame: CGRectMake(0, 0, 400, 300))
        var xFloat: CGFloat = CGRectGetMidX(gameView.bounds)
        var yFloat: CGFloat = CGRectGetMidY(gameView.bounds)
        levelCompleteScoreView?.center = CGPoint(x: xFloat, y: yFloat)
        levelCompleteScoreView?.backgroundColor = UIColor(white: 250, alpha: 1)
        mainView.alpha = 1
        
        //Add tap gesture to remove the new frame
        currentTapGesture = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        currentTapGesture?.delegate = self
        mainView?.addGestureRecognizer(currentTapGesture!)
        
        gameView.addSubview(levelCompleteScoreView!)
        
        //Add the appropriate text with a UILabel
        betweenLevelTextLabel = UILabel(frame: CGRectMake(0, 0, 300, 300))
        betweenLevelTextLabel?.numberOfLines = 4
        xFloat = CGRectGetMidX(levelCompleteScoreView!.bounds)
        yFloat = CGRectGetMidY(levelCompleteScoreView!.bounds)
        betweenLevelTextLabel?.center = CGPointMake(xFloat,yFloat)
        betweenLevelTextLabel?.textAlignment = NSTextAlignment.Center
        betweenLevelTextLabel?.text = "You got \(pointsInt) points! \n \(currentGameManager!.instrumentType!.instrumentType.rawValue) Level - \(currentGameManager!.whichLevel!)"
        levelCompleteScoreView?.addSubview(betweenLevelTextLabel!)
        
        var starImage = UIImageView(image: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("oneStars", ofType: "png")!))
        if (pointsInt>600){starImage = UIImageView(image: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("twoStars", ofType: "png")!))}
        if (pointsInt>1200){starImage = UIImageView(image: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("threeStars", ofType: "png")!))}
        starImage.frame = CGRectMake(0, 0, 200, 133)
        starImage.center = CGPointMake(CGFloat(levelCompleteScoreView!.bounds.midX), CGFloat(levelCompleteScoreView!.bounds.maxY-68))
        levelCompleteScoreView?.addSubview(starImage)
        
        UIGraphicsBeginImageContext(self.levelCompleteScoreView!.bounds.size);
        levelCompleteScoreView?.layer.renderInContext(UIGraphicsGetCurrentContext())
        var screenShot = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        screenShotScore = UIImageJPEGRepresentation(screenShot, 0.8)
        
        saveScore()
        
        
    }
    
    

    //The next three functions check for the correct note according to an int representing each note
    func addPointsWithAnimation(){

        var pointsScored = currentGameManager!.getScoreForNote((gameView!.frame.maxX-latestNoteView!.frame.size.width), currentX: latestNoteView!.frame.minX)
        //println(latestNoteView!.frame.maxX)
        let pointLabel = UILabel(frame: latestNoteView!.frame)
        pointLabel.textAlignment = NSTextAlignment.Center
        pointLabel.font = UIFont.systemFontOfSize(24)
        pointLabel.text = String(pointsScored)
        pointLabel.alpha = 0
        let pointLabelEndPosition = CGRectMake(pointLabel.frame.minX, pointLabel.frame.minY-45, pointLabel.frame.width, pointLabel.frame.height)
        gameView.addSubview(pointLabel)
        
        UIView.animateWithDuration(1.2, delay: 0, options: nil, animations: {pointLabel.alpha = 1; pointLabel.frame = pointLabelEndPosition}, completion: {complete in pointLabel.removeFromSuperview(); self.pointsInt += pointsScored; self.numberOfPoints.text = String(self.pointsInt)})


    }
    
    
    func animateNoteDisappear(){
        gravity.removeItem(latestNoteView!)
        UIView.animateWithDuration(0.5, delay: 0, options: nil, animations: {self.latestNoteView?.alpha = 0; self.latestNoteView?.frame = CGRectMake(self.latestNoteView!.frame.midX, self.latestNoteView!.frame.midY+50, 0, 0)}, completion: {complete in self.latestNoteView?.removeFromSuperview()})
        
    }
    
    
    func subtractPointsWithAnimation(){
        if (latestNoteView?.window != nil){
        let pointLabel = UILabel(frame: latestNoteView!.frame)
        pointLabel.textAlignment = NSTextAlignment.Center
        pointLabel.font = UIFont.systemFontOfSize(20)
        pointLabel.text = "-40"
        pointLabel.alpha = 1
        let pointLabelEndPosition = CGRectMake(pointLabel.frame.minX, pointLabel.frame.minY+60, pointLabel.frame.width, pointLabel.frame.height)
        gameView.addSubview(pointLabel)
            UIView.animateWithDuration(0.5, animations: {pointLabel.alpha = 0; pointLabel.frame = pointLabelEndPosition}, completion: {complete in pointLabel.removeFromSuperview()})
            }
        pointsInt += -40
        numberOfPoints.text = String(pointsInt)
    }
    func checkForCorrectNote (intRepresentingNote: Int){
        //Checks for accuracy based on the note integer. First check to see if there is a note in the view, then check for the proper int.
        if (latestNoteView?.window != nil){
            if latestNoteView?.noteName == intRepresentingNote{
                //Check if the button hasn't been pushed already
                if(latestNoteView?.alpha == 1){

                    addPointsWithAnimation()
                    collisions.removeItem(latestNoteView!)
                    animateNoteDisappear()
                    
                    if (noteScoreInt < 15){
                        var aDelay = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector:Selector("addNewNoteToView"), userInfo: nil, repeats: false)
                        //println("You ran the timer again")
                    }
                    if (noteScoreInt == 15){
                        var aDelay = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector:Selector("newLevel"), userInfo: nil, repeats: false)
                    }

                }
            }
            else
            {
                subtractPointsWithAnimation()
            }
        }
        else
        {
            subtractPointsWithAnimation()
        }
    
    }
    
    @IBAction func newNote() {

        addNewNoteToView()
    }
    

    func chooseInstrument() {
        
        self.currentGameManager = GameManager(levelNumber: gameLevel, instrument: gameInstrumentChoice)
        currentLevelLabel.text = "Level \(gameLevel)" + " - \(gameInstrumentChoice)"
    }
    
    func startMoving(){
        //Use this function for code after game begins
        noteScoreInt = 0
        pointsInt = 0
        numberOfPoints.text = String(pointsInt)
        gravity.angle = 3.1415
        gravity.magnitude = currentGameManager!.getGravityMagnitude()
        mainView.alpha = 1
        
    }
    
    func addNewNoteToView(){
        noteScoreInt++
        noteScore.text = "\(noteScoreInt)/15 \n"
        
        latestNoteView?.removeFromSuperview()
        
        var getNewNote = currentGameManager!.note()
        latestNoteView = getNewNote
        
        //Create a default position for the note, then choose a random stave of the three available
        let staveNumber = arc4random_uniform(3)
        //println("The stave number is \(staveNumber)")
        var yPosition = UInt32(CGRectGetMaxY(gameView.bounds)-227)
        if staveNumber == 0{
            yPosition = UInt32(CGRectGetMaxY(gameView.bounds)-227)
        }
        if staveNumber == 1{
            yPosition = UInt32(CGRectGetMaxY(gameView.bounds)-362)
        }
        if staveNumber == 2{
            yPosition = UInt32(CGRectGetMaxY(gameView.bounds)-496)
        }
        
        //reset the height for the iPhone
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            yPosition = UInt32(CGRectGetMinY(gameView.bounds))
        }
        
        //println(yPosition)
        latestNoteView?.frame = CGRectMake(CGRectGetMaxX(gameView.frame)-(181*iphoneGameViewScale), CGFloat(yPosition), (180*iphoneGameViewScale), (182*iphoneGameViewScale))
        latestNoteView!.alpha=0
        gameView.addSubview(latestNoteView!)

        //println("Should be a new noteView in the subview")
        
        UIView.animateWithDuration(0.5, animations: {self.latestNoteView!.alpha=1}, completion:{
                    complete in
                        self.gravity.addItem(self.latestNoteView!)
                        self.collisions.addItem(self.latestNoteView!)
        })
        
        //Old note creation method based on time intervals
       /*
        if (noteScoreInt < 15){
            var aDelay = NSTimer.scheduledTimerWithTimeInterval(currentGameManager!.getNoteCreationTimeInterval(), target: self, selector:Selector("addNewNoteToView"), userInfo: nil, repeats: false)
        }
        if (noteScoreInt == 15){
            var aDelay = NSTimer.scheduledTimerWithTimeInterval(currentGameManager!.getNoteCreationTimeInterval(), target: self, selector:Selector("newLevel"), userInfo: nil, repeats: false)
        }
        */
    }

    
    @IBAction func touchNoteName(sender: AnyObject) {
        let noteName = sender.currentTitle!
        //println(sender.currentTitle!)
        
        
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
        //This method is called when the High Score board is unwound to the view controller
    }
    
    
    @IBOutlet weak var noteScore: UILabel!
    @IBOutlet weak var numberOfPoints: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var currentLevelLabel: UILabel!
    @IBOutlet weak var levelChooserLabel: UILabel!
    @IBOutlet weak var levelChooserStepper: UIStepper!
    @IBOutlet weak var instrumentChooserStepper: UIStepper!
    @IBOutlet weak var instrumentChooserLabel: UILabel!
    @IBOutlet weak var iPhoneStaff: UIImageView!
    
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
    
    @IBOutlet weak var backButton: UIButton!

    

}

