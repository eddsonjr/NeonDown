//
//  GameScene.swift
//  NeonDown
//
//  Created by Edson  Jr on 12/08/17.
//  Copyright © 2017 Edson  Jr. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    
    //Mark: Init scene
    override func sceneDidLoad() {
     
        generatePlatforms()
    }
    
    
    
    //Mark: Touch functions
    func touchDown(atPoint pos : CGPoint) {
    
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
      
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        
    }
    
    
    
    //Mark: Update Functions
    override func update(_ currentTime: TimeInterval) {
        
    }

    
    
    //Mark: Functions
    func generatePlatforms() {
        
        //create a plataform
        let platform = Plataform(texture: SKTexture(image: #imageLiteral(resourceName: "blueSquare")), color: SKColor.clear, size: CGSize(width: 120, height: 15), platformColorID: ColorIDenum.green.rawValue)
        
        let plataform2 = Plataform(texture: SKTexture(image: #imageLiteral(resourceName: "blueSquare")), color: SKColor.clear, size: CGSize(width: 120, height: 15), platformColorID: ColorIDenum.green.rawValue)
       
        
        platform.position = CGPoint(x: (1.25*(platform.frame.width/2)), y: 0)
        plataform2.position = CGPoint(x: -(1.25*(platform.frame.width/2)), y: 0)
      
        
        self.addChild(platform)
        self.addChild(plataform2)
        
        
    }
    
    
    
    
}
