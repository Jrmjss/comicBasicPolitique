//
//  GameViewController.swift
//  canvas game test1
//
//  Created by Jeremie Josse on 21/06/2017.
//  Copyright © 2017 Jeremie Josse. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var mainFrame: UIImageView!
    @IBOutlet weak var MainView: UIView!
    
    let background : UIImage = #imageLiteral(resourceName: "background")
    let sendArrow : UIImage = #imageLiteral(resourceName: "Send")
    
    let jhead1 : UIImage = #imageLiteral(resourceName: "jhead1")
    let jhead2 : UIImage = #imageLiteral(resourceName: "jhead2")
    let jhead3 : UIImage = #imageLiteral(resourceName: "jhead3")
    let jbody1 : UIImage = #imageLiteral(resourceName: "jbody1")
    let jbody2 : UIImage = #imageLiteral(resourceName: "jbody2")
    
    let lhead1 : UIImage = #imageLiteral(resourceName: "lhead1")
    let lhead2 : UIImage = #imageLiteral(resourceName: "lhead2")
    let lhead3 : UIImage = #imageLiteral(resourceName: "lhead3")
    let lbody1 : UIImage = #imageLiteral(resourceName: "lbody1")
    let lbody2 : UIImage = #imageLiteral(resourceName: "lbody2")
    
    let mhead1 : UIImage = #imageLiteral(resourceName: "mhead1")
    let mhead2 : UIImage = #imageLiteral(resourceName: "mhead2")
    let mhead3 : UIImage = #imageLiteral(resourceName: "mhead3")
    let mbody1 : UIImage = #imageLiteral(resourceName: "mbody1")
    let mbody2 : UIImage = #imageLiteral(resourceName: "mbody2")
    
    @IBOutlet weak var CharSwitch: UISegmentedControl!
    
    @IBOutlet var mainTap: UITapGestureRecognizer!
    @IBOutlet var HeadTapLeft: UISwipeGestureRecognizer!
    @IBOutlet var HeadTapRight: UISwipeGestureRecognizer!
    @IBOutlet var BodyTapLeft: UISwipeGestureRecognizer!
    @IBOutlet var BodyTapRight: UISwipeGestureRecognizer!
  
    @IBOutlet weak var frame1: UIImageView!
    @IBOutlet weak var frame2: UIImageView!
    
    var frames : Array<UIImageView> = []
    var heads : Array<UIImage> = []
    var bodies : Array<UIImage> = []
    var CaseHasPlayed : Array<Bool> = [false, false, true ]
    var TrueCountArr : Array<Bool> = []
    var TrueCount = 0
    var headsIndex = 0
    var bodiesIndex = 0
    var frameNumb = 0
    var PreviousIndex = 0
    var Case0LastHeadIndex = 0
    var Case0LastBodyIndex = 0
    var Case1LastHeadIndex = 0
    var Case1LastBodyIndex = 0
    var Case2LastHeadIndex = 0
    var Case2LastBodyIndex = 0
    //var Case0HasPlayed = false
    //var Case1HasPlayed = false
    //var Case2HasPlayed = false
    
    var black = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
    
    var Head : UIImageView!
    var Body : UIImageView!
    
    @IBOutlet weak var Jhead: UIImageView!
    @IBOutlet weak var Jbody: UIImageView!
    @IBOutlet weak var Lhead: UIImageView!
    @IBOutlet weak var Lbody: UIImageView!
    @IBOutlet weak var Mhead: UIImageView!
    @IBOutlet weak var Mbody: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        frames = [frame1, frame2]
        mainFrame.image = background
        mainFrame.layer.borderWidth = 1
        mainFrame.layer.borderColor = black.cgColor
        mainFrame.isUserInteractionEnabled = true
        mainFrame.addGestureRecognizer(mainTap)
        
        CharSwitch.setImage(sendArrow, forSegmentAt: 3)
        CharSwitch.setEnabled(false, forSegmentAt: 2)
        //CharSwitch.setEnabled(false, forSegmentAt: 3)
        
        UIGraphicsBeginImageContext(MainView.bounds.size);
        
        Head = Jhead
        Body = Jbody
        heads = [jhead1,jhead2,jhead3]
        bodies = [jbody1,jbody2]
        
        Head.isUserInteractionEnabled = true
        HeadTapRight.direction = UISwipeGestureRecognizerDirection.right
        HeadTapLeft.direction = UISwipeGestureRecognizerDirection.left
        
        Head.image = heads[0]
        Head.addGestureRecognizer(HeadTapLeft)
        Head.addGestureRecognizer(HeadTapRight)
        
        
        Body.isUserInteractionEnabled = true
        BodyTapRight.direction = UISwipeGestureRecognizerDirection.right
        BodyTapLeft.direction = UISwipeGestureRecognizerDirection.left
        
        Body.image = bodies[0]
        Body.addGestureRecognizer(BodyTapLeft)
        Body.addGestureRecognizer(BodyTapRight)

        
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }
    
    @IBAction func handleCharSwitch(_ sender: Any) {
        
        switch PreviousIndex{
        case 0 :
            Case0LastHeadIndex = headsIndex
            Case0LastBodyIndex = bodiesIndex
            CaseHasPlayed[0] = true
            CharSwitch.setEnabled(false, forSegmentAt: 0)
        case 1:
            Case1LastHeadIndex = headsIndex
            Case1LastBodyIndex = bodiesIndex
            CaseHasPlayed[1] = true
            CharSwitch.setEnabled(false, forSegmentAt: 1)
        case 2:
            Case2LastHeadIndex = headsIndex
            Case2LastBodyIndex = bodiesIndex
            CaseHasPlayed[2] = true
            CharSwitch.setEnabled(false, forSegmentAt: 2)
        case 3:
            print("NewFrame")
        default:
            break;
        }
        
        Head.removeGestureRecognizer(HeadTapLeft)
        Head.removeGestureRecognizer(HeadTapRight)
        Head.isUserInteractionEnabled = false
        Body.removeGestureRecognizer(BodyTapLeft)
        Body.removeGestureRecognizer(BodyTapRight)
        Body.isUserInteractionEnabled = false
        
        switch CharSwitch.selectedSegmentIndex{
        case 0 :
            Head = Jhead
            Body = Jbody
            
            heads = [jhead1,jhead2,jhead3]
            bodies = [jbody1,jbody2]
            
            headsIndex = Case0LastHeadIndex
            bodiesIndex = Case0LastBodyIndex
            
            PreviousIndex = CharSwitch.selectedSegmentIndex
            
        case 1 :
            Head = Lhead
            Body = Lbody
            
            heads = [lhead1,lhead2,lhead3]
            bodies = [lbody1,lbody2]
            
            headsIndex = Case1LastHeadIndex
            bodiesIndex = Case1LastBodyIndex
            
            PreviousIndex = CharSwitch.selectedSegmentIndex
            
        case 2:
            Head = Mhead
            Body = Mbody
            
            heads = [mhead1,mhead2,mhead3]
            bodies = [mbody1,mbody2]
            
            headsIndex = Case2LastHeadIndex
            bodiesIndex = Case2LastBodyIndex
            
            PreviousIndex = CharSwitch.selectedSegmentIndex
            
        case 3:
            if frameNumb > 1 {
                frameNumb = 0
            }
            
            UIGraphicsBeginImageContextWithOptions(MainView.bounds.size, true, 0)
            MainView.drawHierarchy(in: MainView.bounds, afterScreenUpdates: true)
            
            frames[frameNumb].image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            frames[frameNumb].layer.borderWidth = 1
            frames[frameNumb].layer.borderColor = black.cgColor
            frameNumb = frameNumb+1

            CharSwitch.setEnabled(false, forSegmentAt: 3)
            CaseHasPlayed[0] = false
            CharSwitch.setEnabled(true, forSegmentAt: 0)
            CaseHasPlayed[1] = false
            CharSwitch.setEnabled(true, forSegmentAt: 1)
            CaseHasPlayed[2] = false
            CharSwitch.setEnabled(true, forSegmentAt: 2)
            
            CharSwitch.selectedSegmentIndex = 2
            
            Head = Mhead
            Body = Mbody
            
            heads = [mhead1,mhead2,mhead3]
            bodies = [mbody1,mbody2]
            
            headsIndex = Case2LastHeadIndex
            bodiesIndex = Case2LastBodyIndex
            
            PreviousIndex = CharSwitch.selectedSegmentIndex
            
            
            
        default:
            break;
        }
        
        Head.addGestureRecognizer(HeadTapLeft)
        Head.addGestureRecognizer(HeadTapRight)
        Head.isUserInteractionEnabled = true
        Body.addGestureRecognizer(BodyTapLeft)
        Body.addGestureRecognizer(BodyTapRight)
        Body.isUserInteractionEnabled = true
        
        
        TrueCountArr = CaseHasPlayed.filter { $0 }
        TrueCount = TrueCountArr.count
        
        if TrueCount == CharSwitch.numberOfSegments-2 {
            CharSwitch.setEnabled(true, forSegmentAt: 3)
        }
        print(TrueCount)
        //print(CharSwitch.selectedSegmentIndex)
        //print(PreviousIndex)
    }
    
    //@IBAction func handleMainTap(_ sender: Any) {
        
    //}
    
    @IBAction func handleHeadLeft(_ sender: Any) {
        print("left")
        if headsIndex != 0 {
            headsIndex = headsIndex-1
        } else {
            headsIndex = heads.count-1
        }
        Head.image = heads[headsIndex]
    }
    
    @IBAction func handleHeadRight(_ sender: Any) {
        print("right")
        if headsIndex != heads.count-1 {
            headsIndex = headsIndex+1
        } else {
            headsIndex = 0
        }
        Head.image = heads[headsIndex]
    }
    
    @IBAction func handleBodyLeft(_ sender: Any) {
        if bodiesIndex != 0 {
            bodiesIndex = bodiesIndex-1
        } else {
            bodiesIndex = bodies.count-1
        }
        Body.image = bodies[bodiesIndex]
    }
    
    @IBAction func handleBodyRight(_ sender: Any) {
        if bodiesIndex != bodies.count-1 {
            bodiesIndex = bodiesIndex+1
        } else {
            bodiesIndex = 0
        }
        Body.image = bodies[bodiesIndex]
    }
    

    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
