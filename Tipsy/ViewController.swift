//
//  ViewController.swift
//  Tipsy
//
//  Created by Philip Yu on 1/28/19.
//  Copyright © 2019 Philip Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    } // end viewDidLoad function
    
    override func viewWillAppear(_ animated: Bool) {
        
        let defaults = UserDefaults.standard
        let percentSetting = defaults.integer(forKey: "tipPercent")
        
        tipControl.selectedSegmentIndex = percentSetting
        
    } // viewWillAppear function

    @IBAction func onEdit(_ sender: Any) {
        
        print("Tap Detected")
        view.endEditing(true)
        
    } // end onEdit function
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0
    
        // Calculate the tip and total
        let tipPercentages = [0.1, 0.15, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update the tip and total labels
        if (bill < 1000000000) {
            tipLabel.text = String.localizedStringWithFormat("$%.2f", tip)
            totalLabel.text = String.localizedStringWithFormat("$%.2f", total)
        }
        
    } // end calculateTip function
    
} // end ViewController class

