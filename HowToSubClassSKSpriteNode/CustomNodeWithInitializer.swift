//
//  CustomNodeWithInitializer.swift
//  Misc
//
//  Created by Pete Barber on 11/08/2014.
//  Copyright (c) 2014 foobarber. All rights reserved.
//

import Foundation

import SpriteKit

class CustomSpriteNodeWithInitializer : SKSpriteNode
{
    // Properties that can be handled by a generated initializer
    let value = 0
    var value1 : Int?
    let myName: String!
    
    required init(coder aDecoder: NSCoder!)
    {
        super.init(coder: aDecoder)
    }
    
    init(myName: String, imageNamed imageName: String)
    {
        self.myName = myName
        
        let color = UIColor()
        let texture = SKTexture(imageNamed: imageName)
        let size = texture.size()
        super.init(texture: texture, color: color, size: size)
    }
}