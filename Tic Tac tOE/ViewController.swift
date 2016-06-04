//
//  ViewController.swift
//  Tic Tac tOE
//
//  Created by Fabian Vergara on 2016-05-31.
//  Copyright © 2016 fvergara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPlayer = 1 // even for x, odd for O
    @IBOutlet var endOfTheGameLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    @IBOutlet var button: UIButton!
    
    var gameState = [0 ,0 ,0,
                     0, 0, 0,
                     0, 0, 0]
    
    var gameActive = true
    
    let winningCombinations = [
                                //Graphical representation of the possible combinantions
        
                                //Horizontal representation
                                [0, 1, 2],
                                [3, 4, 5],
                                [6, 7, 8],
                                
                                //Vertical representation
                                [0,
                                 3,
                                 6],
                                
                                [   1,
                                    4,
                                    7],
                                
                                [      2,
                                       5,
                                       8],
                                
                                //Diagonal representation
                                [0,
                                    4,
                                       8],
                                
                                [      2,
                                    4,
                                 6]     ]
                                
                                
    
    @IBAction func buttonPressed(sender: AnyObject) {
        if (gameState[sender.tag] == 0 && gameActive){
            if (currentPlayer % 2 == 0){
                sender.setImage(UIImage(named: "x.png"), forState: .Normal)
                gameState[sender.tag] = 2 // player 2
            }else{
                sender.setImage(UIImage(named: "o.png"), forState: .Normal)
                gameState[sender.tag] = 1 // player 1

            }
            currentPlayer += 1
            endOfTheGameListener()
        }else if !gameActive{
            setLabelAndShowButton("It's a DRAW", colour: UIColor.whiteColor())
        }
        
       // endOfTheGameListener()
    }
    
    private func endOfTheGameListener(){
      //  print ("End of the game listener executed")
        for combinations in winningCombinations{
            
            if (gameState[combinations[0]] != 0 &&
                gameState[combinations[0]] == gameState[combinations[1]] &&
                gameState[combinations[1]] == gameState[combinations[2]]){
                
                if (gameState[combinations[0]] == 1){
                    setLabelAndShowButton("Player one WON!", colour: UIColor.greenColor())
                }else{
                    setLabelAndShowButton("Play two WON!", colour: UIColor.greenColor())
                }
                
                self.gameActive = false
            }
        }
    }
    
    func setLabelAndShowButton(label: String, colour: UIColor){
        self.endOfTheGameLabel.text = label
        self.endOfTheGameLabel.textColor = colour
        self.endOfTheGameLabel.hidden = false
        self.playAgainButton.hidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.endOfTheGameLabel.hidden = true
        self.playAgainButton.hidden   = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

