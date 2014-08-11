//
//  NonSpriteKitExamples.swift
//  Misc
//
//  Created by Pete Barber on 11/08/2014.
//  Copyright (c) 2014 foobarber. All rights reserved.
//

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
