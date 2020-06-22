//
//  ResultsViewController.swift
//  Tip Calculator
//  Created by Nareshri Babu on 20/04/2020.
//  Concept by London App Brewery
//  Copyright © 2020 Nareshri Babu. All rights reserved.
//  This app was created for learning purposes.
//  All images were only used for learning purposes and do not belong to me.
//  All sounds were only used for learning purposes and do not belong to me.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var billPerPerson = "0.00"
    var tip = 10
    var split = 2
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = billPerPerson
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
    }
    
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
        
    }
    



}
