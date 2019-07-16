//
//  ViewController.swift
//  PickerViewStuff
//
//  Created by Jacob Emory Bullin on 6/12/19.
//  Copyright © 2019 Jacob Emory Bullin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var colors = ["", "Red", "Yellow", "Green", "Blue", "White", "Turquise", "Fuschia"];
    var redText = "";
    var blueText = "";
    var colorText = "";
    var sliderValue: Int = 1;
    var selectedColor:String = "";
    var colorSelections = "";
    
    @IBOutlet var pickerView: UIPickerView!;
    
    @IBOutlet var lblDisplayNumber: UILabel!;
    @IBOutlet var lblDisplayResults: UILabel!;
    
    @IBOutlet var swBlue: UISwitch!;
    @IBOutlet var swRed: UISwitch!;
    
    @IBOutlet var slidr: UISlider!;
    
    @IBAction func swRed(_ sender:UISwitch){
        if sender.isOn
        {
            colorSelections = colorSelections.contains("Blue") ? "Blue & Red":"Red";
        }
        else
        {
            colorSelections = colorSelections.contains("Blue") ? "Blue":"";
        }
    }
    
    @IBAction func swBlue(_ sender:UISwitch){
        if sender.isOn
        {
            colorSelections = colorSelections.contains("Red") ? "Red & Blue":"Blue";
        }
        else
        {
            colorSelections = colorSelections.contains("Red") ? "Red":"";
        }
    }
    
    @IBAction func sldrNumbers(_ sender:UISlider){
        sliderValue = Int(sender.value);
        lblDisplayNumber.text = String(sliderValue);
    }
    
    @IBAction func btnGetResults(_ sender:UIButton)
    {
        lblDisplayResults.text = colorSelections.isEmpty ? "You selected the number \(sliderValue), and from the picker, \(selectedColor)":"You selected \(colorSelections), the number \(sliderValue), and from the picker, \(selectedColor)";
        
//        lblDisplayResults.text = "You selected \(colorSelections), the number \(sliderValue), and from the picker, \(selectedColor)";
    }
    
    @IBAction func btnStartOver(_ sender:Any){
        colorText = "";
        sliderValue = 1;
        selectedColor = "";
        colorSelections = "";
        lblDisplayResults.text = "";
        lblDisplayNumber.text = "";
        swRed.setOn(false, animated: false);
        swBlue.setOn(false, animated:false);
        pickerView.reloadAllComponents();
        pickerView.delegate = self; //this fixed it
        pickerView.dataSource = self; //causes the pickerview to populate with '?'
        pickerView.selectRow(0, inComponent: 0, animated: true);
        slidr.value = 1;
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        pickerView.delegate = self; //this fixed it
        pickerView.dataSource = self; //causes the pickerview to populate with '?'
        swBlue.setOn(false, animated: false);
        swRed.setOn(false, animated: false);
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedColor = colors[pickerView.selectedRow(inComponent: 0)] //there should be a better and safer way to do this. It would seem that there isnt at this time.
        
//        selectedColor = pickerView.selectedRow(inComponent: 0);
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count;
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row];
    }
    
    public func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = colors[row];
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]);
        pickerView.layer.borderWidth = 5;
        pickerView.layer.borderColor = UIColor.clear.cgColor;
        pickerView.layer.backgroundColor = UIColor.clear.cgColor;
        return myTitle;
    }
    
    

}

