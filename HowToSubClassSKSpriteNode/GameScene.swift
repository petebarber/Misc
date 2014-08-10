//
//  GameScene.swift
//  HowToSubClassSKSpriteNode
//
//  Created by Pete on 09/08/2014.
//  Copyright (c) 2014 foobarber. All rights reserved.
//

import SpriteKit

protocol Foo
{
	init(value: Int)
}

class MyFoo : Foo
{
	required init(value: Int)
	{
		
	}
}

class MyBar : MyFoo
{
	required init(value: Int)
	{
		super.init(value: value)
	}
	
	convenience init()
	{
		self.init(value: 0)
	}
}

class MyBar1 : MyFoo
{
	
}

class MyBaz : MyProtocol
{
	required init(_ value: Int32)
	{
	}
}

class MyBaz1 : MyBaz
{
	
}

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
		//self.simpleAddSprite()
		self.addSpaceship()
		//self.addCustomSprite()
		
		//
		// Protocol base
		//
		let foo = MyFoo(value: 0)
		println("foo:\(foo)")
		
		let bar = MyBar()
		println("bar:\(bar)")
		
		let bar1 = MyBar1(value: 0)
		println("bar1:\(bar1)")
		
		//
		// Class base
		//
		
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
	
	func simpleAddSprite()
	{
		let sprite = SKSpriteNode(imageNamed: "Spaceship")
		sprite.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
		self.addChild(sprite)
	}
	
	func addSpaceship()
	{
		let sprite = Spaceship()
		sprite.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
		self.addChild(sprite)
		
	}
	
	class Spaceship : SKSpriteNode
	{
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
	
	func addCustomSprite()
	{
		let sprite = MySprite(imageNamed: "Spaceship")
		sprite.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
		self.addChild(sprite)
		
	}
	
	class MySprite : SKSpriteNode
	{
		let value = 0
		var value1 : Int?
		
	}
	
	class MySpriteAll : SKSpriteNode
	{
		#if FOO
		override init()
		{
			super.init()
		}
		
		override init(texture texture: SKTexture!, color color: UIColor!, size size: CGSize)
		{
			super.init(texture: texture, color: color, size: size)
		}
		#endif
	}
}
