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
    
    
    //Mark: Global vars
    var lastYPosition: CGFloat?
    
    
    
    private let dbgmsg = "[GameScene]: "
    
    
    
    //Mark: Init scene
    override func sceneDidLoad() {
      
       
       
    }
    
    
    override func didMove(to view: SKView) {
     
        //criando plataformas - Test
        generatePlatforms(totalOfPlatforms: 10, currentPlatform: 1, ratioOfYDistances: -45.5, firstYPos: 250, platformColorID: getTypeOfPlatform())
        
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
    
    
    //Generate Y and X Platforms in screen
    func generatePlatforms(totalOfPlatforms: Int,currentPlatform: Int,ratioOfYDistances: Float,firstYPos: Float, platformColorID: Int){
        
        
        //Calculate the platform Y position using arithmetic progression
        var currentYPos = CGFloat(firstYPos + (Float(currentPlatform) - 1)*(ratioOfYDistances))
      
        if currentPlatform > totalOfPlatforms {
            print(dbgmsg + "ALL PLATFORMS GENERATED.")
            lastYPosition = currentYPos
            return
        }else {
            print(dbgmsg + "Current plaftform number: \(currentPlatform)")
            
            
            switch platformColorID {
    
                case ColorIDenum.green.rawValue:
                    print(dbgmsg + "GREEN platform")
                    
                    //Create a platform
                    let platform = Plataform(texture: SKTexture(image: #imageLiteral(resourceName: "greenSquare")), color: SKColor.clear, size: CGSize(width: 120, height: 25), platformColorID: ColorIDenum.green.rawValue)
                
                    //setup platform y position
                    platform.position = CGPoint(x: letfOrRight(platform: platform), y: currentYPos)
                    //add chield node
                    self.addChild(platform)
    
                    print(dbgmsg + "Platform: \(platform.platformColorID) | \(platform.position) | \(platform.size)")
                    break
                
                
                
                case ColorIDenum.blue.rawValue:
                    print(dbgmsg + "BLUE platform")
                    let platform = Plataform(texture: SKTexture(image: #imageLiteral(resourceName: "blueSquare")), color: SKColor.clear, size: CGSize(width: 120, height: 25), platformColorID: ColorIDenum.green.rawValue)
                
                    //setup platform y position
                    platform.position = CGPoint(x: letfOrRight(platform: platform), y: currentYPos)
                    //add chield node
                    self.addChild(platform)
                    
                    print(dbgmsg + "Platform: \(platform.platformColorID) | \(platform.position) | \(platform.size)")

  
                break

                
                default:
                    print(dbgmsg + "DEFAULT>> GREEN platform")
                    let platform = Plataform(texture: SKTexture(image: #imageLiteral(resourceName: "greenSquare")), color: SKColor.clear, size: CGSize(width: 120, height: 25), platformColorID: ColorIDenum.green.rawValue)
                
                    //setup platform y position
                    platform.position = CGPoint(x: letfOrRight(platform: platform), y: currentYPos)
                    //add chield node
                    self.addChild(platform)
                    
                    print(dbgmsg + "Platform: \(platform.platformColorID) | \(platform.position) | \(platform.size)")
                
                break
            } //close switch case
            
        }
        
        //recurusive mode
        generatePlatforms(totalOfPlatforms: totalOfPlatforms, currentPlatform: (currentPlatform+1), ratioOfYDistances: ratioOfYDistances, firstYPos: firstYPos,platformColorID: platformColorID)
    }
    
    
    
    
    
    
    //This functions chooses the type of platfomr 
    func getTypeOfPlatform() -> Int {
        
        let typeOfPlatform = Int(arc4random_uniform(UInt32(ColorIDenum.count)))
        print(dbgmsg + "Platform color id: \(typeOfPlatform)")
        return typeOfPlatform
        
    }
    
    
    //This function determines X platform location
    func letfOrRight(platform: Plataform) -> CGFloat {
        
        let leftOrRigth = Int(arc4random_uniform(2))
        var xPosition: CGFloat?
        
        if leftOrRigth == 0 {
            print(dbgmsg + "Platform in left of screen")
            xPosition = CGFloat((platform.size.width/2) + (platform.size.width*0.25))
        }else {
            print(dbgmsg + "Platform in rigth of screen")
            xPosition = CGFloat(-((platform.size.width/2) + (platform.size.width*0.25)))
            
        }
        return xPosition!
    }
    
    
    
    
    
}
