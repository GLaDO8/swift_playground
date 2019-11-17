//
//  Concentration.swift
//  concentration
//
//  Created by shreyas gupta on 17/11/19.
//  Copyright © 2019 shreyas gupta. All rights reserved.
//

//Model file

import Foundation

class Concentration {
    var cards = [Card]() //bracket for initialiser
    var totalScore = 0
    var indexOfOneAndOnlyFaceUpCard: Int? //int if one card up, else nil
    
    init(numberOfPairsOfCards: Int){
        //creates pairs of indentical cards
        //pairs are created because we are passing the same card twice. so essentially changing properties of one will change others too. 
        for _ in 0...numberOfPairsOfCards{
            //card should pick its own identifier
            let card = Card()
            //gets copied
            cards+=[card, card]
        }
        //TODO: shuffle cards
    }
    
    func chooseCard(at index: Int){
        //ignore if cards are already matched
        if !cards[index].isMatched{
            //unpack optional and make sure we didn't choose the already selected card
            //one card is already flipped up
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                //check if the ids match
                if(cards[index].id == cards[matchIndex].id){
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            
            //none or two cards are flipped up
            }else{
                for ind in cards.indices{
                    cards[ind].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
}
