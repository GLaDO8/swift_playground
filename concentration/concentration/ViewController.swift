//
//  ViewController.swift
//  concentration
//
//  Created by shreyas gupta on 15/11/19.
//  Copyright © 2019 shreyas gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    //MVC - Model
    //lazy means unless the variable game is not used, the variable is not initialised
    //lazy cannot have a didSet
    lazy var game = Concentration(numberOfPairsOfCards:  (cardButtons.count + 1)/2)
    
    //instance variables are called properties in swift
    //didset is a property observer which is called whenever the property is set. 
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Count: \(flipCount)"
        }
    }
    
    //array which stores the emoji of each card
    var emojiArr = ["👻", "💀", "🎃", "👹", "😈", "👽", "⚰️"]
    var emojiDict = [Int: String]()
    
    //IBOutlet creates a instance variable
    @IBOutlet weak var flipCountLabel: UILabel!
    
    //array to store the UIButton object referring to each card
    @IBOutlet var cardButtons: [UIButton]!
    
    //IBaction is a xcode directive to tell xcode where the method is in the UI
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount+=1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            
            //when we choose a card, the model has changed. so view update view from model
            updateViewFromModel()
        }
    }
    
    //updates all the cards
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(setEmoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0.4725214243, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5575068593, blue: 0, alpha: 1)
            }
        }
    }
    
    func setEmoji(for card: Card) -> String{
        //randomly pick a emoji from emojiArr
        print(card.id, card.isFaceUp)
        if emojiDict[card.id] == nil, emojiArr.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiArr.count)))
            emojiDict[card.id] = emojiArr.remove(at: randomIndex)
        }
        //return if not nil, else return ?
        return emojiDict[card.id] ?? "?"
    }
}

