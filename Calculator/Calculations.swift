//
//  Calculations.swift
//  Calculator
//
//  Created by owen tanner on 2019-05-22.
//  Copyright © 2019 owen tanner. All rights reserved.
//

import Foundation

class Calculations {
    
    var firstNumber : Double?
    var secondNumber : Double?
    
    var operation : String?
    
    func calculateResult() -> Double? {
        
        if(firstNumber != nil){
            if(operation != nil){
                if(secondNumber != nil){
                    switch(operation){
                    case "+":
                        return firstNumber! + secondNumber!
                    default: return nil
                    }
                }else{
                    return firstNumber
                }
            }else{
                return firstNumber
            }
        }else{
            return nil
        }
    }
}
