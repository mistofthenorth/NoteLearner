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
        
    }

    override func viewDidAppear(animated: Bool) {
        animator.addBehavior(gravity)

    }
    
    let gravity = UIGravityBehavior()
    
    
    func randomChooser(){
        noteScoreInt++
        noteScore.text = "\(noteScoreInt)/15"
        
        latestNoteView?.removeFromSuperview()
        var getNewNote = currentLevel?.note()

        latestNoteView = getNewNote
        let yPosition = arc4random_uniform(UInt32(CGRectGetMaxY(mainView.frame)-400))+100
        println(yPosition)
        latestNoteView.frame = CGRectMake(CGRectGetMaxX(mainView.frame)-257, CGFloat(yPosition), 257, 120)
        view.addSubview(latestNoteView)
        gravity.addItem(latestNoteView)
        
        
        if (noteScoreInt < 15){
            var aDelay = NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector:Selector("randomChooser"), userInfo: nil, repeats: false)
            }
        if (noteScoreInt == 15){
            mainView.alpha = 0.2
            currentLevel?.instrumentType?.level = 2
            
            levelLabel = UILabel(frame: CGRectMake(0, 0, 200, 21))
            levelLabel?.center = CGPointMake(450,300)
            levelLabel?.textAlignment = NSTextAlignment.Center
            levelLabel?.text = "Hit Start to Begin Level 2"
            view.addSubview(levelLabel!)
            }

        }

    lazy var animator: UIDynamicAnimator = {let lazilyCreatedUIDynamicAnimator = UIDynamicAnimator(referenceView: self.mainView)
        return lazilyCreatedUIDynamicAnimator
        }()
    
    func startMoving(){
//      Use this function for code after pushing start
        mainView.alpha = 1
        noteScore.text = "0/15"
        noteScoreInt = 0
        levelLabel?.removeFromSuperview()

    }
    
    func updatePoints(){
        pointsInt += 100
        numberOfPoints.text = String(pointsInt)
    }
    
    @IBAction func newNote() {
        startMoving()
        randomChooser()
    }
    
    @IBAction func pressStart(sender: AnyObject) {
        
        self.currentLevel = Level(levelNumber: 1, instrument: (sender.currentTitle!)!)
        noteScore.text = "0/15"
        println(currentLevel?.whichInstrument)
        println(currentLevel?.whichLevel)

        var instrument = Instrument(inst: sender.currentTitle!!, setLevel: 1)
        currentLevel?.instrumentType = instrument
        println(currentLevel?.instrumentType?.describe)

        startButton.removeFromSuperview()
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
        case "D" :
            if((latestNoteView?.window) != nil){
                if latestNoteView.noteName == 3{
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
        case "F#" :
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
        case "A" :
            if((latestNoteView?.window) != nil){
                if latestNoteView.noteName == 10{
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
    var currentLevel: Level? = nil
    var noteScoreInt: Int = 0
    var levelLabel : UILabel?
    weak var latestNoteView: NoteView!

    @IBOutlet weak var noteScore: UILabel!
    
    @IBOutlet weak var altoButton: UIButton!
    @IBOutlet weak var numberOfPoints: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var startButton: UIButton!
}

