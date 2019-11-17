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
struct Card{
    var isMatched = false
    var isFaceUp = false
    var id: Int
    
    static var idFactory = 0
    
    static func setId() -> Int{
        idFactory += 1
        return idFactory
    }
    init(){
        self.id = Card.setId()
    }
}
