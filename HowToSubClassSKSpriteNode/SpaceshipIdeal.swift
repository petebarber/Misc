//
//  SpaceshipIdeal.swift
//  Misc
//
//  Created by Pete Barber on 11/08/2014.
//  Copyright (c) 2014 foobarber. All rights reserved.
//

import SpriteKit
/*
class SpaceshipIdeal : SKSpriteNode
{
    // Other properties & methods ...
    
    override init(/* params */)
    {
        super.init(imageNamed: "Spaceship")
    }
}
*/

class SSInfo
{
    init(funkyName: String)
    {
        
    }
}

func f()
{
    var s = SKSpriteNode(imageNamed: "Spaceship")
    s.userData = NSMutableDictionary()
    s.userData["foo"] = SSInfo(funkyName: "Hello")
}