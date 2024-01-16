//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var displayValue : Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("cannot convert display lablel text to double")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    var isFinishedTyping = true
    
    @IBOutlet var calcButtonPressed: UIButton!
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        
        isFinishedTyping = true

        
        if displayLabel.text == "." {
            displayValue = 0
        }
        
        calculator.setNumber(displayValue)
       
        if let calcMethod = sender.currentTitle {
            
            guard let result = calculator.calculate(calcMethod: calcMethod) else {
                fatalError("the result of calculation is nil")
            }
            displayValue = result
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {            
            if isFinishedTyping {
                displayLabel.text = numValue
                isFinishedTyping = false
            }else{
                
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text! += numValue
            }
        }
    }
    
    
}

