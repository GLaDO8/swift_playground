//
//  gameModel.swift
//  Flippy Cards
//
//  Created by shreyas gupta on 17/11/19.
//  Copyright © 2019 shreyas gupta. All rights reserved.
//

import Foundation

struct GameModel{
    private var cardScores = [Int: Int]()
    private(set) var cardsArr = [Card]()
    private(set) var score = 0
    private var onlyFaceUpCard:Int? { //computed property, newValue is the default parameter name
        get{
            var onlyIndex: Int?
            for index in cardsArr.indices{
                if(cardsArr[index].isFaceUp == true){
                    if(onlyIndex == nil){
                        onlyIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return onlyIndex
        }
        set{
            for index in cardsArr.indices{
                cardsArr[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    init(numberOfCards num: Int){
        assert(num > 0, "GameModel.init(\(num)): must have atleast one pair of card")
        print(num)
        for _ in 0...num{
            let card = Card()
            cardsArr += [card, card]
        }    
        cardsArr.shuffle()
    }
    
    //mutating because its changing values and its a struct.
   mutating func choosecard(chosenCardIndex card: Int){
        assert(cardsArr.indices.contains(card), "GameModel.choosecard(at: \(card)): chosen index not present in cardsArr")
        if (cardScores[card] == nil){
            cardScores[card] = 1
        }else{
            if let matchedCard = onlyFaceUpCard, cardsArr[matchedCard] != cardsArr[card]{
                cardScores[card]!+=1
            }
        }
        if !cardsArr[card].isMatched {
            //CASE1 - one card is already turned up
            if let matchedCard = onlyFaceUpCard, matchedCard != card {
                if(cardsArr[matchedCard] == cardsArr[card]){
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
            }
                //CASE2 - no cards or two cards are turned up
            else{
                onlyFaceUpCard = card
            }
        }
    }
}
