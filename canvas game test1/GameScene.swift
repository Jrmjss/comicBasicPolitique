//
//  GameScene.swift
//  canvas game test1
//
//  Created by Jeremie Josse on 21/06/2017.
//  Copyright © 2017 Jeremie Josse. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // 1
    let player = SKSpriteNode(imageNamed: "player")
    
    override func didMove(to view: SKView) {
        // 2
        backgroundColor = SKColor.white
        // 3
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        // 4
        addChild(player)
        
    }
}
