//
//  ViewController.swift
//  Tipsy
//
//  Created by Philip Yu on 3/23/20.
//  Copyright © 2020 Philip Yu. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    // MARK: - Properties
    private var tipPercentage: Double = 0.10
    private var people: Int = 2
    private var billTotal: Double = 0.0
    private var finalResult: String = "0.0"
    
    // Tap anywhere to dismiss number pad
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        self.view.endEditing(true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.result = finalResult
            destinationVC.tip = Int(tipPercentage * 100)
            destinationVC.split = people
        }
        
    }
    
    // MARK: - IBAction Section
    
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
    
}
