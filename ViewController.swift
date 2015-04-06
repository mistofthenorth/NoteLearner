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
        gravity.magnitude = 0.1
        gravity.angle = 3.142
        mainView.alpha = 0.2

    }

    override func viewDidAppear(animated: Bool) {
        animator.addBehavior(gravity)

    }
    
    let gravity = UIGravityBehavior()

    
    func randomChooser(){
        gravity.magnitude = 0.1
        gravity.angle = 3.142
        let noteNumber = (arc4random_uniform(5)+1)
        switch noteNumber
        {case 1: println("The note is 1")
            let middleC = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("Middle_C", ofType: "png")!)
            let middleCView = UIImageView(image: middleC)
            middleCView.frame = CGRectMake(CGRectGetMaxX(mainView.frame)-257, 400, 257, 120)
            view.addSubview(middleCView)
            middleCUIView = middleCView
            gravity.addItem(middleCView)
            
        case 2: println("The note is 2")
            let middleD = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("Middle_D", ofType: "png")!)
            let middleDView = UIImageView(image: middleD)
            middleDView.frame = CGRectMake(CGRectGetMaxX(mainView.frame)-257, 350, 257, 120)
            view.addSubview(middleDView)
            middleDUIView = middleDView
            gravity.addItem(middleDView)
            
        case 3: println("The note is 3")
            let middleE = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("Middle_E", ofType: "png")!)
            let middleEView = UIImageView(image: middleE)
            middleEView.frame = CGRectMake(CGRectGetMaxX(mainView.frame)-257, 300, 257, 120)
            view.addSubview(middleEView)
            middleEUIView = middleEView
            gravity.addItem(middleEView)
            
        case 4: println("The note is 4")
        let middleF = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("Middle_F", ofType: "png")!)
            let middleFView = UIImageView(image: middleF)
            middleFView.frame = CGRectMake(CGRectGetMaxX(mainView.frame)-257, 250, 257, 120)
            view.addSubview(middleFView)
            middleFUIView = middleFView
            gravity.addItem(middleFView)
            
        case 5: println("The note is 5")
            let middleG = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("Middle_G", ofType: "png")!)
            let middleGView = UIImageView(image: middleG)
            middleGView.frame = CGRectMake(CGRectGetMaxX(mainView.frame)-257, 200, 257, 120)
            view.addSubview(middleGView)
            middleGUIView = middleGView
            gravity.addItem(middleGView)
            
        default: break
        }
    }

    lazy var animator: UIDynamicAnimator = {let lazilyCreatedUIDynamicAnimator = UIDynamicAnimator(referenceView: self.mainView)
        return lazilyCreatedUIDynamicAnimator
        }()
    
    func startMoving(){
//      Use this function for code after pushing start
    }
    
    func updatePoints(){
        pointsInt += 100
        numberOfPoints.text = String(pointsInt)
    }
    
    @IBAction func newNote() {
        randomChooser()
    }
    
    @IBAction func pressStart(sender: AnyObject) {
        mainView.alpha = 1
        startButton.removeFromSuperview()
        startMoving()
        
    }

    
    @IBAction func touchNoteName(sender: AnyObject) {
        let noteName = sender.currentTitle!
        switch noteName!{
        case "C" :
            if((middleCUIView.window) != nil)
            {
                middleCUIView.removeFromSuperview()
                updatePoints()
            }
        case "D" :
            if((middleDUIView.window) != nil)
            {
                middleDUIView.removeFromSuperview()
                updatePoints()
            }
        case "E" :
            if((middleEUIView.window) != nil)
            {
                middleEUIView.removeFromSuperview()
                updatePoints()
            }
        case "F" :
            if((middleFUIView.window) != nil)
            {
                middleFUIView.removeFromSuperview()
                updatePoints()
            }
        case "G" :
            if((middleGUIView.window) != nil)
            {
                middleGUIView.removeFromSuperview()
                updatePoints()
            }
        default: break
        }
        
    }
    var pointsInt: Int = 0
    weak var middleCUIView: UIView!
    weak var middleDUIView: UIView!
    weak var middleEUIView: UIView!
    weak var middleFUIView: UIView!
    weak var middleGUIView: UIView!
    @IBOutlet weak var numberOfPoints: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var startButton: UIButton!
}

