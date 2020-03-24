//
//  ViewController.swift
//  Tipsy
//
//  Created by Philip Yu on 3/23/20.
//  Copyright © 2020 Philip Yu. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    // Outlets
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    // Properties
    var tipPercentage: Double = 0.10
    var people: Int = 2
    var billTotal: Double = 0.0
    var finalResult: String = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        // Exit bill total text field
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tipPercentage = buttonTitleAsANumber / 100
    
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        people = Int(sender.value)
    
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        
        let bill = billTextField.text!
        
        if bill != "" {
            billTotal = Double(bill)!
            
            let result = billTotal * (1 + tipPercentage) / Double(people)
            finalResult = String(format: "%.2f", result)
        }
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.result = finalResult
            destinationVC.tip = Int(tipPercentage * 100)
            destinationVC.split = people
        }
        
    }
    
}
