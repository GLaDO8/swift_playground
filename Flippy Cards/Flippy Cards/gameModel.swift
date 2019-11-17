//
//  gameModel.swift
//  Flippy Cards
//
//  Created by shreyas gupta on 17/11/19.
//  Copyright © 2019 shreyas gupta. All rights reserved.
//

import Foundation

class GameModel{
    var cardsArr = [Card]()
    var score = 0
    var onlyFaceUpCard:Int?
    var cardScores = [Int: Int]()
    
    init(numberOfCards num: Int){
        for _ in 0...num{
            let card = Card()
            cardsArr += [card, card]
        }
        cardsArr.shuffle()
    }

    func choosecard(chosenCardIndex card: Int){
        if (cardScores[card] == nil){
            cardScores[card] = 1
        }else{
            if let matchedCard = onlyFaceUpCard, cardsArr[matchedCard].id != cardsArr[card].id{
                cardScores[card]!+=1
            }
        }
        if !cardsArr[card].isMatched {
            //CASE1 - one card is already turned up
            if let matchedCard = onlyFaceUpCard, matchedCard != card {
                if(cardsArr[matchedCard].id == cardsArr[card].id){
                    cardsArr[matchedCard].isMatched = true
                    cardsArr[card].isMatched = true
                    score+=5
                }else{
                    if let matchedCardScore = cardScores[matchedCard]{
                        if((matchedCardScore > 1) || (cardScores[card]! > 1)){
                            score-=3
                        }
                    }
                }
                cardsArr[card].isFaceUp = true
                onlyFaceUpCard = nil
            }
            //CASE2 - no cards or two cards are turned up
            else{
                for ind in self.cardsArr.indices{
                    cardsArr[ind].isFaceUp = false
                }
                cardsArr[card].isFaceUp = true
                onlyFaceUpCard = card
            }
        }
    }
}
