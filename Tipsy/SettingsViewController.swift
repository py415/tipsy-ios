//
//  SettingsViewController.swift
//  Tipsy
//
//  Created by Philip Yu on 1/28/19.
//  Copyright © 2019 Philip Yu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    } // end viewDidLoad function
    
    @IBAction func defaultTip(_ sender: Any) {
        
        let defaultTip = UserDefaults.standard
        let tipIndex = defaultTipControl.selectedSegmentIndex
        
        defaultTip.set(tipIndex, forKey: "tipPercent")
        defaultTip.synchronize()
        
    } // end defaultTip function
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
