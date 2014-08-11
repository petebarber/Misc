//
//  SpaceshipNode.swift
//  Misc
//
//  Created by Pete Barber on 11/08/2014.
//  Copyright (c) 2014 foobarber. All rights reserved.
//

import SpriteKit

class Spaceship : SKSpriteNode
{
    // Other properties & methods ...
    
    required init(coder aDecoder: NSCoder!)
    {
        super.init(coder: aDecoder)
    }
    
    override init()
    {
        let color = UIColor()
        let texture = SKTexture(imageNamed: "Spaceship")
        let size = texture.size()
        super.init(texture: texture, color: color, size: size)
    }
}