//
//  ViewController.swift
//  Tic Tac tOE
//
//  Created by Fabian Vergara on 2016-05-31.
//  Copyright © 2016 fvergara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!
    
    var currentPlayer = 1 // even for x, odd for O
    
    @IBAction func buttonPressed(sender: AnyObject) {
        if (currentPlayer % 2 == 0){
            sender.setImage(UIImage(named: "x.png"), forState: .Normal)
        }else{
            sender.setImage(UIImage(named: "o.png"), forState: .Normal)
        }
        currentPlayer += 1
        
    }
    
    private func endOfTheGameListener(){
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

