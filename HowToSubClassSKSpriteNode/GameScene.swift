//
//  GameScene.swift
//  HowToSubClassSKSpriteNode
//
//  Created by Pete on 09/08/2014.
//  Copyright (c) 2014 foobarber. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
		//addSimpleSpriteNode()
		//addSpaceshipNode()
		//addCustomSpriteNode()
        //addCustomSpriteNodeWithInitializer()
        addWorkingSpaceship()

    }
    
	func addSimpleSpriteNode() {
		let sprite = SKSpriteNode(imageNamed: "Spaceship")
		sprite.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
		self.addChild(sprite)
	}
	
	func addSpaceshipNode() {
		let sprite = Spaceship()
		sprite.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
		self.addChild(sprite)
		
	}
	
	func addCustomSpriteNode() {
		let sprite = CustomSpriteNode(imageNamed: "Spaceship")
		sprite.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
		self.addChild(sprite)
	}
    
    func addCustomSpriteNodeWithInitializer() {
        let sprite = CustomSpriteNodeWithInitializer(myName: "FunkyName", imageNamed: "Spaceship")
        sprite.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        self.addChild(sprite)
    }
    
    func addWorkingSpaceship() {
        let sprite = WorkingSpaceship(fuel: 10)
        sprite.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        self.addChild(sprite)
        
    }
    
    func addSimpleSpriteNodeWithComponents()
    {
        class SpaceshipInfo
        {
            init(funkyName: String) { /* Stuff */ }
        }

        let sprite = SKSpriteNode(imageNamed: "Spaceship")
        sprite.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        self.addChild(sprite)
        
        userData = NSMutableDictionary()
        userData["SpaceshipInfo"] = SpaceshipInfo(funkyName: "Hello")
    }
}