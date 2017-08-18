//
//  ColorIDenum.swift
//  NeonDown
//
//  Created by Edson  Jr on 12/08/17.
//  Copyright © 2017 Edson  Jr. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit



enum ColorIDenum: Int{
    case clear = 0
    case green = 1
    case blue = 2
    case yellow = 3
    case purple = 4
    
    //return the number of elements in Enum
    static var count: Int { return ColorIDenum.blue.hashValue}
}
