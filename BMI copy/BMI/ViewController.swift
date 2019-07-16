//
//  ViewController.swift
//  BMI
//
//  Created by Jacob Emory Bullin on 6/26/19.
//  Copyright © 2019 Jacob Emory Bullin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flag: Bool = false;
    var height: Double = 0.0;
    var weight: Double = 0.0;
    var segName: String = "segDisplayBMI";
    
    @IBOutlet var txtHeight: UITextField!
    @IBOutlet var txtWeight: UITextField!
    @IBOutlet var lblError: UILabel!
    @IBAction func btnCalculate(_ sender: UIButton) {
        flag = validateData(); 
        if(flag){
            performSegue(withIdentifier: segName, sender: self)
        }
        else{
        }
        
    }
    
    func validateData()->Bool
    {
        if(txtWeight.text!.isEmpty || txtHeight.text!.isEmpty || txtWeight.text == "0" || txtHeight.text == "0"){
            lblError.text = "PLEASE ENTER BOTH VALUES";
            txtHeight.becomeFirstResponder();
            return false;
        }
        else{
            lblError.text = "";
            height = Double((txtHeight.text! as NSString).doubleValue);
            weight = Double((txtWeight.text! as NSString).doubleValue);
            return true;
        }
    }
    
    override func prepare(for Segue:UIStoryboardSegue, sender: Any?)
    {
        let sendValue = Segue.destination as! DisplayBMI;
        sendValue.bmiheight = height;
        sendValue.bmiWeight = weight;
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
//        //create left side empty space so that done button set on right side
//        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
//        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: Selector(("doneButtonAction")))
//        toolbar.setItems([flexSpace, doneBtn], animated: false)
//        toolbar.sizeToFit()
//        //setting toolbar as inputAccessoryView
//        self.txtHeight.inputAccessoryView = toolbar
//        self.txtWeight.inputAccessoryView = toolbar
//        // Do any additional setup after loading the view.
    }

//    func doneButtonAction() {
//        self.view.endEditing(true)
//    }

}

