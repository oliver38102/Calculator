//
//  ViewController.swift
//  Calculator
//
//  Created by owen tanner on 2019-05-15.
//  Copyright © 2019 owen tanner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    
    var calculations = Calculations();
    var readyToAcceptNewNumber = true;
    
    @IBOutlet var theOutlet: [UIButton]!
    
    
    @IBOutlet weak var numberDisplayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - event listeners
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("\(sender.currentTitle ?? "Nil")" + "  pressed");
        
        
        
        var currentVal = numberDisplayLabel.text!;
        
        switch(sender.currentTitle!){
        case "0","1","2","3","4","5","6","7","8","9":
            if(readyToAcceptNewNumber){
                currentVal = sender.currentTitle!;
                readyToAcceptNewNumber = false
            }else{
                currentVal = currentVal+sender.currentTitle!;
            }
        case "c":
            currentVal = "0";
        case ".":
            if(!currentVal.contains(".")){
                currentVal.append(".");
            }
        case "+":
            calculations.operation = sender.currentTitle!
            calculations.firstNumber = Double(currentVal)
            readyToAcceptNewNumber = true;
        case "=":
            calculations.secondNumber = Double(currentVal)
            if let result = calculations.calculateResult(){
                currentVal = String(format:"%g", result)
            }else{
                currentVal = "Error";
            }
            readyToAcceptNewNumber = true;
        default:
            break;
        }
        numberDisplayLabel.text = currentVal;
    }
    
}
