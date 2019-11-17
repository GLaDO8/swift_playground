//
//  Card.swift
//  concentration
//
//  Created by shreyas gupta on 17/11/19.
//  Copyright © 2019 shreyas gupta. All rights reserved.
//

import Foundation

//difference between struct and class
//1. no inheritance in structs
//2. structs are value types. classes are reference types
//structs get free initialiser to initialise all vars

//we won't have the emoji type here because that is the view component and this is the model.

//static methods and variables are associated with the class and not the objects. they are universal to the class.
struct Card {
    static var idFactory = 0
    
    var isFaceUp = false
    var isMatched = false
    var id: Int
    
    static func getUniqueId() -> Int {
        idFactory+=1
        return idFactory
    }
    
    init(){
        self.id = Card.getUniqueId()
    }
}

