//
//  ViewController.swift
//  Pízza Shop
//
//  Created by Jacob Emory Bullin on 6/19/19.
//  Copyright © 2019 Jacob Emory Bullin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var pizzaSizes = ["","Small","Medium","Large"];
    var pizzaTypes = ["","Cheese","Meat Lovers","Vegitarian","Fire Cracker","Caprise"];
    var sliderValue = 1;
    
    var sizeSelection = "";
    var pizzaSelection = "";
    
    var total: Double = 0.0;
    
    var sizeComponent = 0; //TODO: fix this, what does it actually relate to?
    
    
    @IBOutlet var pickerview: UIPickerView!;
    @IBOutlet var lblDisplayNumber: UILabel!;
    @IBOutlet var swSiracha: UISwitch!;
    @IBOutlet var swExtrChs: UISwitch!;
    @IBOutlet var swExtrMeat: UISwitch!;
    @IBOutlet var swRedPeppers: UISwitch!
    @IBOutlet var swRecottaChs: UISwitch!
    
    @IBOutlet var slidr: UISlider!;
    
    @IBOutlet var btnOrder: UIButton!
    @IBOutlet var btnReset: UIButton!
    
    @IBOutlet var OrderConfirmation: UILabel!
    
    @IBAction func btnOrder(_ sender:UIButton){
        if(pickerview.selectedRow(inComponent: 0)==0 && pickerview.selectedRow(inComponent: 1)==0)
        
        {
            OrderConfirmation.text = "Please Select a Size and Type.";
            
            OrderConfirmation.textColor = UIColor.red;
        }
        else if(pickerview.selectedRow(inComponent: 0)==0)
        {
            OrderConfirmation.text = "Please Select a Size.";
            
            OrderConfirmation.textColor = UIColor.red;
        }
        else if(pickerview.selectedRow(inComponent: 1)==0)
        {
            OrderConfirmation.text = "Please Select a Type.";
            
            OrderConfirmation.textColor = UIColor.red;
        }
        else
        {
        if(pickerview.selectedRow(inComponent: 0)==1)
        {
            total = 8.50;
        }
        else if(pickerview.selectedRow(inComponent: 0)==2)
        {
            total = 9.50;
        }
        else if(pickerview.selectedRow(inComponent: 0)==3)
        {
            total = 10.25
        }
        if(swSiracha.isOn)
        {
            total += 0.5;
        }
        if(swExtrChs.isOn)
        {
            total += 0.5;
        }
        if(swExtrMeat.isOn)
        {
            total += 1.5;
        }
        if(swRedPeppers.isOn)
        {
            total += 0.5;
        }
        if(swRecottaChs.isOn)
        {
            total += 0.5;
        }
            total = total * Double(sliderValue)
        OrderConfirmation.text = "You ordered \(sliderValue) \(pizzaSelection) pizzas. Your total is $\(total)";
        OrderConfirmation.textColor = UIColor.black;
        }
        
    }
    
    @IBAction func btnReset(_ sender:UIButton){
        pickerview.selectRow(0
            , inComponent: 0
            , animated: true)
        pickerview.selectRow(0
            , inComponent: 1
            , animated: true)
        
        slidr.setValue(1.00
            , animated: true)
        sliderValue = 1;
        lblDisplayNumber.text = "1"
        //toggleSwitches is a custom function
        toggleSwitches(Sriracha: false
            , ExtraCheese: false
            , ExtraMeat: false
            , RedPeppers: false
            , Recotta: false)
        OrderConfirmation.text = "";
    }
    
    @IBAction func sldrNumbers(_ sender:UISlider){
        sliderValue = Int(sender.value);
        lblDisplayNumber.text = String(sliderValue);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toggleSwitches(Sriracha: false
            , ExtraCheese: false
            , ExtraMeat: false
            , RedPeppers: false
            , Recotta: false)
//        pickerView.delegate = self; //this fixed it
//        pickerView.dataSource = self; //causes the pickerview to populate with '?'
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == sizeComponent){
            //            TODO: fix this in relation to sizeComponent
            return pizzaSizes.count;
        }
        else
        {
            return pizzaTypes.count;
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == sizeComponent {
            //            TODO: fix this in relation to sizeComponent
            return pizzaSizes[row];
        }
        else
        {
            return pizzaTypes[row];
        }
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == sizeComponent)
        {
            let selected = pizzaSizes[row];
            sizeSelection = "\(selected)";
        }
        else{
            //null selection
            if(row == 0)
            {
                toggleSwitches(Sriracha: false
                    , ExtraCheese: false
                    , ExtraMeat: false
                    , RedPeppers: false
                    , Recotta: false);
//                swSiracha.setOn(false, animated: true);
//                swExtrChs.setOn(false, animated: true);
//                swExtrMeat.setOn(false, animated: true);
//                swRedPeppers.setOn(false, animated: true);
//                swRecottaChs.setOn(false, animated: true);
                slidr.setValue(1.00, animated: true);
                lblDisplayNumber.text = "1";
            }
            else if(row == 1)
                //cheese
            {
                toggleSwitches(Sriracha: false
                    , ExtraCheese: true
                    , ExtraMeat: false
                    , RedPeppers: false
                    , Recotta: true)
            }
            else if(row == 2)
                //meat
            {
                toggleSwitches(Sriracha: false
                    , ExtraCheese: false
                    , ExtraMeat: true
                    , RedPeppers: false
                    , Recotta: false)
            }
            else if(row == 3)
                //veg
            {
                toggleSwitches(Sriracha: false
                    , ExtraCheese: false
                    , ExtraMeat: false
                    , RedPeppers: true
                    , Recotta: false)
            }
            else if(row == 4)
                //fire
            {
                toggleSwitches(Sriracha: true
                    , ExtraCheese: false
                    , ExtraMeat: false
                    , RedPeppers: true
                    , Recotta: false)
            }
            else if(row == 5)
                //caprise
            {
                toggleSwitches(Sriracha: false
                    , ExtraCheese: true
                    , ExtraMeat: false
                    , RedPeppers: true
                    , Recotta: true)
            }
            
            let selected2 = pizzaTypes[row];
            pizzaSelection = "\(selected2)";
            
        }
        
        
    }
    //this is a custom function that allows quick toggling of switches
    func toggleSwitches(Sriracha:Bool, ExtraCheese:Bool, ExtraMeat:Bool, RedPeppers:Bool, Recotta:Bool)
    {
        swSiracha.setOn(Sriracha, animated: true);
        swExtrChs.setOn(ExtraCheese, animated: true);
        swExtrMeat.setOn(ExtraMeat, animated: true);
        swRedPeppers.setOn(RedPeppers, animated: true);
        swRecottaChs.setOn(Recotta, animated: true);
    }



}

