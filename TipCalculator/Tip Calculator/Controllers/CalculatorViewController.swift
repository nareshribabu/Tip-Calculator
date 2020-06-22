//
//  ViewController.swift
//  Tip Calculator
//  Created by Nareshri Babu on 20/04/2020.
//  Concept by London App Brewery
//  Copyright © 2020 Nareshri Babu. All rights reserved.
//  This app was created for learning purposes.
//  All images were only used for learning purposes and do not belong to me.
//  All sounds were only used for learning purposes and do not belong to me.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.00
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
       
        billTextField.endEditing(true)
        
        let buttonTitle : String
        

        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false

        sender.isSelected = true
        
        //remove the percentage sign and make into percentage
        buttonTitle = sender.title(for: .normal)!
        
        let buttonTitleWithoutPercentage = buttonTitle.dropLast()
        
        let numericalPercentage = Double(buttonTitleWithoutPercentage)
        
        tip = numericalPercentage! / 100
            

    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
       
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        
        if bill != "" {
            
            //calculate how much each person has to pay
            billTotal = Double(bill)!
            
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            
            finalResult = String(format: "%.2f", result)
        }
         
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "goToResult" {
            
            let destinationVC = segue.destination as! ResultsViewController
         
            destinationVC.billPerPerson = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }
    
}

