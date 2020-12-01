//
//  ViewController.swift
//  calc
//
//  Created by   Андрей on 19.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resultLabel.center.x -= view.bounds.width
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0){
            self.resultLabel.center.x += self.view.bounds.width
        }

    }

    var operand = ""
    var numberOne = ""
    var numberTwo = ""

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func inputNumber(_ sender: UIButton) {
        
        if operand.isEmpty{
            numberOne = numberOne + (sender.titleLabel?.text)!
            resultLabel.text = numberOne
        } else {
            numberTwo = numberTwo + (sender.titleLabel?.text)!
            resultLabel.text = numberTwo
        }
        
    }
    
    @IBAction func clearAction(_ sender: UIButton) {
        numberOne = ""
        numberTwo = ""
        operand = ""
        resultLabel.text = "0"
    }
    
    @IBAction func inputOperand(_ sender: UIButton) {
        operand = sender.titleLabel?.text as! String
    }
    
    @IBAction func resultAction(_ sender: UIButton) {
        var result = 0.0
        
        switch  operand {
        case "/":
            result = Double(numberOne)! / Double(numberTwo)!
        case "*":
            result = Double(numberOne)! * Double(numberTwo)!
        case "+":
            result = Double(numberOne)! + Double(numberTwo)!
        case "-":
            result = Double(numberOne)! - Double(numberTwo)!
        default:
            break
        }
        
        if result.truncatingRemainder(dividingBy: 1.0) == 00 {
            resultLabel.text = String(Int(result))
        } else {
            resultLabel.text = String(result) 
        }
        
        numberOne = String(Int(result))
        operand = ""
        numberTwo = ""

    }
    
}

