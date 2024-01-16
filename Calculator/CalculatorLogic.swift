//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Ninja on 30/12/2023.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number : Double?
    private var intermediateCalculation : (n1 : Double , calcMethod:String)?
    
    
    mutating func setNumber(_ number : Double) {
        self.number = number
    }
    
    mutating func calculate(calcMethod:String) -> Double? {
        
        if let number = number {
            if calcMethod == "+/-" {
                return number * -1
            }else if calcMethod == "%"{
                return number / 100
            }else if calcMethod == "AC" {
                return 0
            }else if calcMethod == "="{
                return performNumCalc(n2 : number)
            }else {
                intermediateCalculation = (n1:number,calcMethod:calcMethod)
            }
        }
        
        return nil
    }
    
    private func performNumCalc(n2 : Double) -> Double? {
        if let n1 = intermediateCalculation?.n1 , let operation = intermediateCalculation?.calcMethod {
//            if operation == "+" {
//                return n1 + n2
//            }else if operation == "-" {
//                return n1 - n2
//            }else if operation == "*" {
//                return n1 * n2
//            }
            
            switch operation {
            case "+" : return n1 + n2
            case "-" : return n1 - n2
            case "x" : return n1 * n2
            case "÷" :  return n1 / n2
            default : fatalError("the operation cant be done")
            }
        
        }
        return nil
    }
    
}
