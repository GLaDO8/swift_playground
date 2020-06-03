//
//  ViewController.swift
//  Flippy Cards
//
//  Created by shreyas gupta on 17/11/19.
//  Copyright © 2019 shreyas gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // INITIALISATIONS AND PROPERTY DECLARATIONS

    //initialise our game model
    private lazy var game = GameModel(numberOfCards: (cardArr.count + 1)/2)
    
    //only readable by others
    private(set) var flipCount: Int = 0{
        didSet{
            updateFlipCountLabels()
        }
    }
    //function to update flipcount
    private func updateFlipCountLabels(){
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: #colorLiteral(red: 1, green: 0, blue: 0.3095360994, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "FlipCount: \(flipCount)", attributes: attributes)
        //setting our flipcountlabel's attributes with the new string
        flipCountLabel.attributedText = attributedString
    }
    
    //this is a outlet to control the flipcount label, the attributes of which are controlled using a NSattributedString
    @IBOutlet weak var flipCountLabel: UILabel!{
        didSet{
            updateFlipCountLabels()
        }
    }
    
    //we create an array of UIButton objects in the viewcontroller. These are card abstractions in the controller section. The same abstraction in the model is a card Object.
    @IBOutlet private var cardArr: [UIButton]!
    private var emojiString = "👻💀🎃👹😈👽⚰️🕸🧟‍♂️🦇🩸👺"
    private var emojiDict = [Card: String]()
    @IBOutlet private weak var scoreLabel: UILabel!
    
    //FUNCTIONS
    
    @IBAction private func newGame(_ sender: UIButton) {
        game = GameModel(numberOfCards: (cardArr.count + 1)/2)
        emojiDict = [Card: String]()
        emojiString = "👻💀🎃👹😈👽⚰️🕸🧟‍♂️🦇🩸👺"
        updateAllCards()
    }
    @IBAction private func cardClick(_ sender: UIButton) {
        if let cardIndex = cardArr.index(of: sender){
            game.choosecard(chosenCardIndex: cardIndex)
            updateAllCards()
            scoreLabel.text = "SCORE: " + String(game.score)
        }
        print(game.score)
        flipCount+=1
    }
    private func updateAllCards(){
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
    //we want to make the cards directly hashable rather than using the identifier
    private func setEmoji(for card: Card) -> String {
        print(emojiString.count)
        if emojiDict[card] == nil, emojiString.count > 0{
            let randomStringIndex = emojiString.index(emojiString.startIndex, offsetBy: emojiString.count.arc4random)
            emojiDict[card] = String(emojiString.remove(at: randomStringIndex))
        }
        //return if not nil, if nil return ?
        return emojiDict[card] ?? "?"
    }
}

//extensions let you add meaningful additional properties or vars to an existing class even if you don't have any access to that class.
extension Int{
    var arc4random: Int{
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else{
            return 0
        }
    }
}
