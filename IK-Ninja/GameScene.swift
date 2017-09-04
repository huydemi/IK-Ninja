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
  
  override func didMove(to view: SKView) {
    // You obtain a reference to the lower torso node by its name, “torso_lower”, and assign its value to the lowerTorso property. 
    // Next, you set its position to the center of the screen with an offset of -30 units.
    lowerTorso = childNode(withName: "torso_lower")
    lowerTorso.position = CGPoint(x: frame.midX, y: frame.midY - 30)
    
    // Similarly, you grab a reference to the shadow node by its name, “shadow”, and assign its value to the shadow property. 
    // Finally, you set its position to the center of the screen with an offset of -100 units.
    shadow  = childNode(withName: "shadow")
    shadow.position = CGPoint(x: frame.midX, y: frame.midY - 100)
  }
}
