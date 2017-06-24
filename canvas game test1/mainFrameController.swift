//
//  mainFrameController.swift
//  canvas game test1
//
//  Created by Jeremie Josse on 23/06/2017.
//  Copyright © 2017 Jeremie Josse. All rights reserved.
//

import UIKit
import SpriteKit

class mainFrame: UIViewController {
    
    override func viewDidLoad() {
        
        let MainFrame = view as! mainFrame
        MainFrame.showsFPS = true
        MainFrame.showsNodeCount = true
        MainFrame.ignoresSiblingOrder = true
        MainFrame
        
        skView.presentScene(scene)
    }
}
