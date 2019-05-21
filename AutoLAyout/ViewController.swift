//
//  ViewController.swift
//  AutoLAyout
//
//  Created by Soumil on 16/04/19.
//  Copyright © 2019 LPTP233. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    var input1:Double = 0
    var input2:Double = 0
    var operatorInput = ""
    var flag = 0
    var prevValue: Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func operationButtonAction(_ sender: UIButton) {
        if prevValue == 0 {
                input1 = Double(resultLabel.text!)!
        }else {
            input1 = prevValue
        }
        operatorInput = (sender.titleLabel?.text)!
    }
    
    @IBAction func percentageButtonAction(_ sender: UIButton) {
        prevValue = performPercentage()
        resultLabel.text = String (prevValue)
        clearValues()
        flag = 1
    }
    
    @IBAction func inputButtonAction(_ sender: UIButton) {
        prevValue = 0
        if flag == 1 {
            flag = 0
            resultLabel.text = "0"
        }
        if input1 != 0 {
            resultLabel.text = "0"
        }
        if (resultLabel.text?.count)! < 10 {
            if (resultLabel.text == "0") && (sender.titleLabel!.text != ".") {
                resultLabel.text = sender.titleLabel?.text
            }
            else {
            resultLabel.text = resultLabel.text! + (sender.titleLabel?.text)!
            }
        }
    }
    
    @IBAction func clearButtonAction(_ sender: UIButton) {
        clearValues()
        resultLabel.text = "0"
    }
    
    @IBAction func performSquare(_ sender: UIButton) {
        input1 = Double(resultLabel.text!)!
        prevValue = performSquare()
       resultLabel.text = String(prevValue)
        clearValues()
        flag = 1
    }
    
    @IBAction func equalButtonAction(_ sender: UIButton) {
        performOperation()
    }
    
    func performAddition() -> Double {
        return (input1 + input2)
    }
    
    func performSubtraction() -> Double {
        return (input1 - input2)
    }
    
    func performMultition() -> Double {
        return (input1 * input2)
    }
    
    func performDivition() -> String {
        if input1 == 0 {
            return "Invalid Input"
        }else {
            return String((input1/input2))
        }
    }
    
    func performPercentage() -> Double {
        return (input1/100)
    }
    
    func performSquare() -> Double {
        return (input1 * input1)
    }
    
    func performOperation(){
            input2 = Double(resultLabel.text!)!
            switch operatorInput {
            case "÷":
                prevValue = Double(performDivition())!
                resultLabel.text = String(prevValue)
            case "x":
                prevValue = performMultition()
                resultLabel.text = String (prevValue)
            case "-":
                prevValue = performSubtraction()
                resultLabel.text = String (prevValue)
            case "+":
                prevValue = performAddition()
                resultLabel.text = String (prevValue)
            default:
                break
            }
            clearValues()
            flag = 1
    }
    
    func clearValues() {
        input1 = 0
        input2 = 0
        operatorInput = ""
    }
}

