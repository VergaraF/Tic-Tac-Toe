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
            currentPlayer += 1
            endOfTheGameListener()
        }else if !gameActive && !thereIsAWinner{
            setLabelAndShowButton("It's a DRAW", colour: UIColor.whiteColor())
        }
        
       // endOfTheGameListener()
    }
    
    @IBAction func playAgainButton(sender: AnyObject) {
        print("_____BEGIN______")
        for i in 0 ..< gameState.count{
            
            print(String(gameState[i]) + "<- Current game state")
            gameState[i] = 0
            print(String(gameState[i]) + "<- Old game state")
            print("Execution # " + String(i))
        }
        print("______END_____")
        gameActive = true
        hideLabelAndPlayAgainButton(true, firstTime:  false)
        
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
                
                gameActive = false
                thereIsAWinner = true
                
                UIView.animateWithDuration(0.3, animations: {
                    self.endOfTheGameLabel.center = CGPoint(x: self.endOfTheGameLabel.center.x + 400, y: self.endOfTheGameLabel.center.y)
                })
                UIView.animateWithDuration(1, animations: {
                    self.playAgainButton.center   = CGPoint(x: self.playAgainButton.center.x - 400, y: self.playAgainButton.center.y)
                })
            }
        }
    }
    
    func setLabelAndShowButton(label: String, colour: UIColor){
        endOfTheGameLabel.text      = label
        endOfTheGameLabel.textColor = colour
        hideLabelAndPlayAgainButton(false, firstTime: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideLabelAndPlayAgainButton(true, firstTime: true)
       

        // Do any additional setup after loading the view, typically from a nib.
    }
    

    func hideLabelAndPlayAgainButton(hide: Bool, firstTime: Bool){
        if !firstTime && hide{
            UIView.animateWithDuration(0.4, animations: {
                self.endOfTheGameLabel.center = CGPoint(x: self.endOfTheGameLabel.center.x - 600, y: self.endOfTheGameLabel.center.y)
               // self.endOfTheGameLabel.hidden = hide
                
            })
            UIView.animateWithDuration(0.6, animations: {
                self.playAgainButton.center   = CGPoint(x: self.playAgainButton.center.x + 600, y: self.playAgainButton.center.y)
              //  self.playAgainButton.hidden   = hide
                
            })
        }else if !firstTime && !hide{
            endOfTheGameLabel.hidden = hide
            playAgainButton.hidden   = hide
            
        }else if firstTime{
        
            endOfTheGameLabel.center = CGPoint(x: endOfTheGameLabel.center.x - 400, y: endOfTheGameLabel.center.y)
            playAgainButton.center   = CGPoint(x: playAgainButton.center.x + 400, y: playAgainButton.center.y)
            endOfTheGameLabel.hidden = hide
            playAgainButton.hidden   = hide
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

