//
//  GameScene.swift
//  NeonDown
//
//  Created by Edson  Jr on 12/08/17.
//  Copyright © 2017 Edson  Jr. All rights reserved.
//

import SpriteKit
import GameplayKit
import Foundation
import UIKit

class GameScene: SKScene {
    
    
    //Mark: Global vars
    var lastYPosition: CGFloat?
    
    
    //debug message
    private let dbgmsg = "[GameScene]: "
    
    
    //schedule timer
    var timerToGeneratePlatforms: Timer?
    
    
    
    //Mark: Init scene
    override func sceneDidLoad() {
      
       
       
    }
    
    
    override func didMove(to view: SKView) {
     
        //criando plataformas - Test
        generatePlatforms(totalOfPlatforms: 10, currentPlatform: 1, ratioOfYDistances: -45.5, firstYPos: 250, platformColorID: getTypeOfPlatform())
        
        
        //testando o handlertimer
        startTimer()
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
        let currentYPos = CGFloat(firstYPos + (Float(currentPlatform) - 1)*(ratioOfYDistances))
      
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
    
                    print(dbgmsg + "Platform: \(String(describing: platform.platformColorID)) | \(platform.position) | \(platform.size)")
                    break
                
                
                
                case ColorIDenum.blue.rawValue:
                    print(dbgmsg + "BLUE platform")
                    let platform = Plataform(texture: SKTexture(image: #imageLiteral(resourceName: "blueSquare")), color: SKColor.clear, size: CGSize(width: 120, height: 25), platformColorID: ColorIDenum.green.rawValue)
                
                    //setup platform y position
                    platform.position = CGPoint(x: letfOrRight(platform: platform), y: currentYPos)
                    //add chield node
                    self.addChild(platform)
                    
                    print(dbgmsg + "Platform: \(String(describing: platform.platformColorID)) | \(platform.position) | \(platform.size)")

  
                break

                
                default:
                    print(dbgmsg + "DEFAULT>> GREEN platform")
                    let platform = Plataform(texture: SKTexture(image: #imageLiteral(resourceName: "greenSquare")), color: SKColor.clear, size: CGSize(width: 120, height: 25), platformColorID: ColorIDenum.green.rawValue)
                
                    //setup platform y position
                    platform.position = CGPoint(x: letfOrRight(platform: platform), y: currentYPos)
                    //add chield node
                    self.addChild(platform)
                    
                    print(dbgmsg + "Platform: \(String(describing: platform.platformColorID)) | \(platform.position) | \(platform.size)")
                
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
    
    
    
    
    
    //Mark: Timer functions
    
    //starttimer
    func startTimer() {
        
        self.timerToGeneratePlatforms = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(handleTimer(timer:)), userInfo: nil, repeats: true)
    }
    
    
    func handleTimer(timer: Timer) {
        print(dbgmsg + "calling handler timer. Creating more platforms.")
        
        //create more platforms
        generatePlatforms(totalOfPlatforms: 10, currentPlatform: 1, ratioOfYDistances: -45.5, firstYPos: 250, platformColorID: getTypeOfPlatform())
        
    }
    
    func stopTimer() {
        self.timerToGeneratePlatforms?.invalidate()
    }

    
    
    
    
    
    
    
}
