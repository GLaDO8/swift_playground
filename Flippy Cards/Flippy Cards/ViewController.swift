//
//  ViewController.swift
//  Flippy Cards
//
//  Created by shreyas gupta on 17/11/19.
//  Copyright © 2019 shreyas gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //initialise our game model
    lazy var game = GameModel(numberOfCards: (cardArr.count + 1)/2)
    //we create an array of UIButton objects in the viewcontroller. These are card abstractions in the controller section. The same abstraction in the model is a card Object.
    @IBOutlet var cardArr: [UIButton]!
    var emojiArr1 = ["👻", "💀", "🎃", "👹", "😈", "👽", "⚰️", "🕸", "🧟‍♂️", "🦇"]
    var emojiDict = [Int: String]()
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBAction func cardClick(_ sender: UIButton) {
        if let cardIndex = cardArr.index(of: sender){
            game.choosecard(chosenCardIndex: cardIndex)
            updateAllCards()
            scoreLabel.text = "SCORE: " + String(game.score)
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        game = GameModel(numberOfCards: (cardArr.count + 1)/2)
        emojiDict = [Int: String]()
        emojiArr1 = ["👻", "💀", "🎃", "👹", "😈", "👽", "⚰️", "🕸", "🧟‍♂️", "🦇", "🩸"]
        updateAllCards()
    }
    
    func updateAllCards(){
        for card in cardArr.indices{
            if(game.cardsArr[card].isFaceUp){
                cardArr[card].setTitle(setEmoji(for: game.cardsArr[card]), for: UIControl.State.normal)
                cardArr[card].backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else{
                cardArr[card].setTitle("", for: UIControl.State.normal)
                cardArr[card].backgroundColor = game.cardsArr[card].isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0, blue: 0.3095360994, alpha: 1)
            }
        }
    }
    
    func setEmoji(for card: Card) -> String {
        if emojiDict[card.id] == nil, emojiArr1.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiArr1.count)))
            emojiDict[card.id] = emojiArr1.remove(at: randomIndex)
        }
        //return if not nil, if nil return ?
        return emojiDict[card.id] ?? "?"
    }
}

