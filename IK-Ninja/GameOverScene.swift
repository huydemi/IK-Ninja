//
//  GameOverScene.swift
//  IK-Ninja
//
//  Created by Dang Quoc Huy on 9/4/17.
//  Copyright © 2017 Ken Toh. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
  override func didMove(to view: SKView) {
    
    let myLabel = SKLabelNode(fontNamed:"Chalkduster")
    myLabel.text = "Game Over"
    myLabel.fontSize = 65
    myLabel.position = CGPoint(x:frame.midX, y:frame.midY)
    addChild(myLabel)
    
    run(SKAction.sequence([
      SKAction.wait(forDuration: 1.0),
      SKAction.run({
        let transition = SKTransition.fade(withDuration: 1.0)
        let scene = GameScene(fileNamed:"GameScene")
        scene!.scaleMode = .aspectFill
        scene!.size = self.size
        self.view?.presentScene(scene!, transition: transition)
      })]))
  }
}
