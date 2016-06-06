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
    //used to know if it is a DRAW
    var drawValidator = 0
    
    var gameState = [0 ,0 ,0,
                     0, 0, 0,
                     0, 0, 0]
    
    var gameActive = true
    var thereIsAWinner = false
    
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
            drawValidator += gameState[sender.tag]
            currentPlayer += 1
        }
        print(gameActive)
        endOfTheGameListener()
    }
    
    @IBAction func playAgainButton(sender: AnyObject) {

        gameState = [Int](count: 9, repeatedValue: 0)
        gameActive = true
        thereIsAWinner = false
        hideLabelAndPlayAgainButton(true, firstTime:  false)
        
    }
    
    
    private func endOfTheGameListener(){
 
        //checking if someone win
        for combinations in winningCombinations{
            
            if (gameState[combinations[0]] != 0 &&
                gameState[combinations[0]] == gameState[combinations[1]] &&
                gameState[combinations[1]] == gameState[combinations[2]]){
                
                if (gameState[combinations[0]] == 1){
                    setLabelAndShowButton("Player one WON!", colour: UIColor.greenColor())
                }else{
                    setLabelAndShowButton("Play two WON!", colour: UIColor.greenColor())
                }
                
                currentPlayer = 1
                gameActive = false
                thereIsAWinner = true
                
            }
        }
        
        //checking if it is a draw
        var validator = 0
        for i in 0 ..< gameState.count{
            if gameState[i] == 1{
                validator += 1
            }else if gameState[i] == 2{
                validator += 2
            }else if gameState[i] == 0{
                validator -= 1
            }
        
        }
        
        if validator == drawValidator {
            setLabelAndShowButton("It's a DRAW", colour: UIColor.whiteColor())
            thereIsAWinner = true
            gameActive = false
        }
        
        
        //Animations of send of the game label and play again button
        UIView.animateWithDuration(0.3, animations: {
            self.endOfTheGameLabel.center = CGPoint(x: self.endOfTheGameLabel.center.x + 600, y: self.endOfTheGameLabel.center.y)
        })
        UIView.animateWithDuration(1, animations: {
            self.playAgainButton.center   = CGPoint(x: self.playAgainButton.center.x - 600, y: self.playAgainButton.center.y)
        })
        
    }
    
    func setLabelAndShowButton(label: String, colour: UIColor){
        endOfTheGameLabel.text      = label
        endOfTheGameLabel.textColor = colour
        hideLabelAndPlayAgainButton(false, firstTime: false)
    }
    

    func hideLabelAndPlayAgainButton(hide: Bool, firstTime: Bool){
        
        //If it isnt the first time the game gets executed and we want to hide them
        if !firstTime && hide{
            UIView.animateWithDuration(0.4, animations: {
                self.endOfTheGameLabel.center = CGPoint(x: self.endOfTheGameLabel.center.x - 600, y: self.endOfTheGameLabel.center.y)
                self.endOfTheGameLabel.hidden = hide
                
            })
            UIView.animateWithDuration(0.6, animations: {
                self.playAgainButton.center   = CGPoint(x: self.playAgainButton.center.x + 600, y: self.playAgainButton.center.y)
                self.playAgainButton.hidden   = hide
                
            })
            
        //If it isnt the first time the game gets executed and we want to show them
        }else if !firstTime && !hide{
            endOfTheGameLabel.hidden = hide
            playAgainButton.hidden   = hide
        
        //If it is the first time the game gets executed 
        }else if firstTime{
        
            endOfTheGameLabel.center = CGPoint(x: endOfTheGameLabel.center.x - 600, y: endOfTheGameLabel.center.y)
            playAgainButton.center   = CGPoint(x: playAgainButton.center.x + 600, y: playAgainButton.center.y)
            endOfTheGameLabel.hidden = hide
            playAgainButton.hidden   = hide
        }
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideLabelAndPlayAgainButton(true, firstTime: true)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

