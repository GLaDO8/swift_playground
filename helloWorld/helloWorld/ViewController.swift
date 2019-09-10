//
//  ViewController.swift
//  helloWorld
//
//  Created by shreyas gupta on 4/7/19.
//  Copyright © 2019 shreyas gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func showMessage(sender: UIButton){
        
        func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        
        let emojiDict = [
            "🦄" : "Unicorn",
            "👑" : "Crown",
            "❤️" : "Heart"
        ]
        
        let buttonID = sender
        var meaning = "dummy"
        
        //!!!understand optionals properly!!!
        if let emojilookup = buttonID.titleLabel?.text{
            meaning = emojiDict[emojilookup]!
        }
        
        let alertController = UIAlertController(title: "Hello World, welcome to my app!", message: meaning, preferredStyle: UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
}

