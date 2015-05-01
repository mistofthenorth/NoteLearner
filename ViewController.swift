//
//  ViewController.swift
//  NoteLearner
//
//  Created by Brian M Owen on 3/25/15.
//  Copyright (c) 2015 Brian Owen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        gravity.magnitude = 0.2
        gravity.angle = 3.142
        mainView.alpha = 0.2
        
        setButtonLayout()
        
    }

    override func viewDidAppear(animated: Bool) {
        animator.addBehavior(gravity)

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
            let sharpsAndFlatsConstraint:Array = NSLayoutConstraint.constraintsWithVisualFormat("H:|-25-[buttonCsharp]-[buttonDsharp(==buttonCsharp)]-35-[buttonFsharp(==buttonCsharp)]-[buttonGsharp(==buttonCsharp)]-[buttonAsharp(==buttonCsharp)]-25-|", options: NSLayoutFormatOptions(0), metrics: nil, views: sharpsAndFlatsDictionary)
            
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
    
    let gravity = UIGravityBehavior()
    
    
    func randomChooser(){
        noteScoreInt++
        noteScore.text = "\(noteScoreInt)/15"
        
        latestNoteView?.removeFromSuperview()
        var getNewNote = currentGameManager?.note()

        latestNoteView = getNewNote
        let yPosition = arc4random_uniform(UInt32(CGRectGetMaxY(gameView.bounds)-120))
        println(yPosition)
        latestNoteView.frame = CGRectMake(CGRectGetMaxX(gameView.frame)-1, CGFloat(yPosition), 257, 120)
        gameView.addSubview(latestNoteView)
        gravity.addItem(latestNoteView)
        
        
        if (noteScoreInt < 15){
            var aDelay = NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector:Selector("randomChooser"), userInfo: nil, repeats: false)
            }
        if (noteScoreInt == 15){
            var aDelay = NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector:Selector("newLevel"), userInfo: nil, repeats: false)
            }

        }

    func newLevel(){
        mainView.alpha = 0.5
        currentGameManager?.instrumentType?.level = 2
        
        betweenLevelTextLabel = UILabel(frame: CGRectMake(0, 0, 200, 21))
        let xFloat: CGFloat = CGRectGetMaxX(mainView.frame)/2
        let yFloat: CGFloat = CGRectGetMaxY(mainView.frame)/2
        betweenLevelTextLabel?.center = CGPointMake(xFloat,yFloat)
        betweenLevelTextLabel?.textAlignment = NSTextAlignment.Center
        betweenLevelTextLabel?.text = "Hit Start to Begin Level 2"
        view.addSubview(betweenLevelTextLabel!)
    }
    
    lazy var animator: UIDynamicAnimator = {let lazilyCreatedUIDynamicAnimator = UIDynamicAnimator(referenceView: self.mainView)
        return lazilyCreatedUIDynamicAnimator
        }()
    
    func startMoving(){
//      Use this function for code after pushing start
        mainView.alpha = 1
        noteScore.text = "0/15"
        noteScoreInt = 0
        betweenLevelTextLabel?.removeFromSuperview()

    }
    
    func updatePoints(){
        pointsInt += 100
        numberOfPoints.text = String(pointsInt)
    }
    
    @IBAction func newNote() {
        startMoving()
        randomChooser()
    }
    
    @IBAction func chooseInstrument(sender: AnyObject) {
        
        self.currentGameManager = GameManager(levelNumber: 1, instrument: (sender.currentTitle!)!)
        noteScore.text = "0/15"

        trumpetButton.removeFromSuperview()
        altoButton.removeFromSuperview()
        startMoving()
        
    }

    
    @IBAction func touchNoteName(sender: AnyObject) {
        let noteName = sender.currentTitle!
        println(sender.currentTitle!)
        
        
        switch noteName!{
        case "C" :
            if (latestNoteView?.window != nil){
                if latestNoteView.noteName == 1{
                updatePoints()
                latestNoteView.removeFromSuperview()

                }
            }
        case "C#/Db" :
            if (latestNoteView?.window != nil){
                if latestNoteView.noteName == 2{
                    updatePoints()
                    latestNoteView.removeFromSuperview()
                    
                }
            }
        case "D" :
            if((latestNoteView?.window) != nil){
                if latestNoteView.noteName == 3{
                    updatePoints()
                    latestNoteView.removeFromSuperview()
             
                }
            }
        case "D#/Eb" :
            if (latestNoteView?.window != nil){
                if latestNoteView.noteName == 4{
                    updatePoints()
                    latestNoteView.removeFromSuperview()
                    
                }
            }
        case "E" :
            if((latestNoteView?.window) != nil){
                if latestNoteView.noteName == 5{
                    updatePoints()
                    latestNoteView.removeFromSuperview()
                    
                }
            }
        case "F" :
            if((latestNoteView?.window) != nil){
                if latestNoteView.noteName == 6{
                    updatePoints()
                    latestNoteView.removeFromSuperview()
                    
                }
            }
        case "F#/Gb" :
            if((latestNoteView?.window) != nil){
                if latestNoteView.noteName == 7{
                    updatePoints()
                    latestNoteView.removeFromSuperview()
                    
                }
            }
        case "G" :
            if((latestNoteView?.window) != nil){
                if latestNoteView.noteName == 8{
                    updatePoints()
                    latestNoteView.removeFromSuperview()
                    
                }
            }
        case "G#/Ab" :
            if (latestNoteView?.window != nil){
                if latestNoteView.noteName == 9{
                    updatePoints()
                    latestNoteView.removeFromSuperview()
                    
                }
            }
        case "A" :
            if((latestNoteView?.window) != nil){
                if latestNoteView.noteName == 10{
                    updatePoints()
                    latestNoteView.removeFromSuperview()
                    
                }
            }
        case "A#/Bb" :
            if (latestNoteView?.window != nil){
                if latestNoteView.noteName == 11{
                    updatePoints()
                    latestNoteView.removeFromSuperview()
                    
                }
            }
        case "B" :
            if((latestNoteView?.window) != nil){
                if latestNoteView.noteName == 12{
                    updatePoints()
                    latestNoteView.removeFromSuperview()
                    
                }
            }
        default: break
        }
        
    }
    var pointsInt: Int = 0
    var noteScoreInt: Int = 0
    
    var currentGameManager: GameManager? = nil

    var betweenLevelTextLabel : UILabel?
    
    weak var latestNoteView: NoteView!

    @IBOutlet weak var noteScore: UILabel!
    @IBOutlet weak var trumpetButton: UIButton!
    @IBOutlet weak var altoButton: UIButton!
    @IBOutlet weak var numberOfPoints: UILabel!
    @IBOutlet weak var mainView: UIView!
    
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
    
    @IBOutlet weak var mainText: UILabel!
    
    @IBOutlet weak var gameView: UIView!
    
    

}

