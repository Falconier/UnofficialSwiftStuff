//
//  ViewController.swift
//  Discounts
//
//  Created by Jacob Emory Bullin on 5/29/19.
//  Copyright © 2019 Jacob Emory Bullin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtDisAmt: UITextField!
    @IBOutlet var txtSubTtl: UITextField!
    @IBAction func daBtn(_ sender: UIButton) {
        let TAX = 1.07;
//        var subtotal:Double = 0.0;
        var total:Double = 0.0;
        let name = txtName.text!;
        let tipAmt = Double(txtDisAmt.text!);
        let price = Double(txtSubTtl.text!);
        var tip:Double = 0.0;
        
        
        if tipAmt != 0 && price != 0
        {
            tip = price! * (tipAmt! / 100);
            total = price! * TAX + tip;
            
            txtOutput.textColor = UIColor.purple;
            txtOutput.text = String(format: "Thank you \(name), with tax your total is: $%.02f, the tip itself is \(tip)",total);
        }
        else
        {
            txtOutput.textColor = UIColor.red;
            txtOutput.text = "Please enter a name, tip percentage, and meal cost";
            txtName.becomeFirstResponder();
        }
        
    }
    
    @IBOutlet var txtOutput: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}
