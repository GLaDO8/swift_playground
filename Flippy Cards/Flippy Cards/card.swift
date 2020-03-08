//
//  card.swift
//  Flippy Cards
//
//  Created by shreyas gupta on 17/11/19.
//  Copyright © 2019 shreyas gupta. All rights reserved.
//

import Foundation

//here, card is built upon the UIButton element and is an abstraction of various parameters of the card.
//we won't be adding the emoji label variable here as that is part of the view
//id is the abstraction for same emoji. two cards with same emoji will have the same id
struct Card: Hashable{
    var isMatched = false
    var isFaceUp = false
    private var id: Int
    
    //making struct hashable by implementing hashable protocol
    var hashValue: Int {return self.id}
       static func ==(lhs: Card, rhs: Card) -> Bool{
           return (lhs.id == rhs.id)
    }
    private static var idFactory = 0
     
    private static func setId() -> Int{
        idFactory += 1
        return idFactory
    }
    init(){
        self.id = Card.setId()
    }
}  
