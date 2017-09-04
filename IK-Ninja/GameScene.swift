/**
 Copyright (c) 2016 Razeware LLC
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

import SpriteKit

class GameScene: SKScene {
  // You create two SKNode properties to reference the shadow node and lower torso node (the root node of the ninja), respectively.
  var shadow: SKNode!
  var lowerTorso: SKNode!
  
  var upperTorso: SKNode!
  var upperArmFront: SKNode!
  var lowerArmFront: SKNode!
  var fistFront: SKNode!
  
  override func didMove(to view: SKView) {
    // You obtain a reference to the lower torso node by its name, “torso_lower”, and assign its value to the lowerTorso property. 
    // Next, you set its position to the center of the screen with an offset of -30 units.
    lowerTorso = childNode(withName: "torso_lower")
    lowerTorso.position = CGPoint(x: frame.midX, y: frame.midY - 30)
    
    // Similarly, you grab a reference to the shadow node by its name, “shadow”, and assign its value to the shadow property. 
    // Finally, you set its position to the center of the screen with an offset of -100 units.
    shadow  = childNode(withName: "shadow")
    shadow.position = CGPoint(x: frame.midX, y: frame.midY - 100)
    
    upperTorso = lowerTorso.childNode(withName: "torso_upper")
    upperArmFront = upperTorso.childNode(withName: "arm_upper_front")
    lowerArmFront = upperArmFront.childNode(withName: "arm_lower_front")
    fistFront = lowerArmFront.childNode(withName: "fist_front")
    
    let rotationConstraintArm = SKReachConstraints(lowerAngleLimit: CGFloat(0), upperAngleLimit: CGFloat(160))
    lowerArmFront.reachConstraints = rotationConstraintArm
  }
  
  func punchAt(_ location: CGPoint) {
    // reach(to:rootNode:duration:) is an action responsible for performing inverse kinematics actions for a joint hierarchy reaching out to a point in space.
    // It takes in three arguments: (1) the desired end position to reach; (2) the highest node of the hierarchy that you want to rotate; and (3) the duration of the animation.
    let punch = SKAction.reach(to: location, rootNode: upperArmFront, duration: 0.1)
    // Next, you run the action on the end node that is going to reach out to touch the end position in space, which in this case is the lower arm.
    fistFront.run(punch)
  }
  
  // Upon a touch event, you run the punch action with the tap location as the end position that you want the lower arm to reach.
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch: AnyObject in touches {
      let location = touch.location(in: self)
      punchAt(location)
    }
  }
  
}
