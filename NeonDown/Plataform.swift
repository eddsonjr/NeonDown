//
//  Plataform.swift
//  NeonDown
//
//  Created by Edson  Jr on 12/08/17.
//  Copyright © 2017 Edson  Jr. All rights reserved.
//


import Foundation
import SpriteKit


class Plataform: SKSpriteNode {
    
    
    private let dbgmsg = "[Platform]: "
    var platformColorID: Int?
    
    
    init(texture: SKTexture, color: SKColor, size: CGSize,platformColorID: Int) {
        super.init(texture: texture, color: color, size: size)
        self.platformColorID = platformColorID
        
        print(dbgmsg + "Platform Created: | \(self.position) | \(self.size) | \(self.platformColorID)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
