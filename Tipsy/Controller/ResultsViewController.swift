//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Philip Yu on 3/23/20.
//  Copyright © 2020 Philip Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    // MARK: - Properties
    var result: String = "0.0"
    var tip: Int = 10
    var split: Int = 2
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
        
    }
    
    // MARK: - IBAction Section

    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
