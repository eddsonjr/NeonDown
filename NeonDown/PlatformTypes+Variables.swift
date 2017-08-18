//
//  PlatformTypes+Variables.swift
//  NeonDown
//
//  Created by Edson  Jr on 18/08/17.
//  Copyright © 2017 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit


extension SKSpriteNode {
    
    static var greenPlatform: Plataform {
        get{
            return Plataform.init(texture: SKTexture(image: #imageLiteral(resourceName: "greenSquare")), color: SKColor.clear, size: CGSize(width: 120, height: 15), platformColorID: ColorIDenum.green.rawValue)
        }
    }
    
    
    static var bluePlatform: Plataform {
        get {
            return Plataform.init(texture: SKTexture(image: #imageLiteral(resourceName: "blueSquare")), color: SKColor.clear, size: CGSize(width: 120, height: 15), platformColorID: ColorIDenum.green.rawValue)
        }
    }
    
    
}
