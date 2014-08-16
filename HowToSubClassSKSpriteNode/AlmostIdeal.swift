//
//  imageNamed.swift
//  Misc
//
//  Created by Pete Barber on 16/08/2014.
//  Copyright (c) 2014 foobarber. All rights reserved.
//

import Foundation
import SpriteKit

class HideRequired : SKSpriteNode {}

class MySKSpriteNode : HideRequired {
    init(imageNamed imageName: String) {
        let color = UIColor()
        let texture = SKTexture(imageNamed: imageName)
        let size = texture.size()
        super.init(texture: texture, color: color, size: size)
    }
}

class WorkingSpaceship : MySKSpriteNode {
    let fuel: Int
    
    init(fuel: Int) {
        self.fuel = fuel
        super.init(imageNamed: "Spaceship")
    }
}