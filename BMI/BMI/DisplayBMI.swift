//
//  DisplayBMI.swift
//  BMI
//
//  Created by Jacob Emory Bullin on 6/26/19.
//  Copyright © 2019 Jacob Emory Bullin. All rights reserved.
//

import UIKit

class DisplayBMI: UIViewController {
    
    @IBOutlet var lblResults: UILabel!
    
    @IBOutlet var lblOverUnder: UILabel!
    
    var bmiheight: Double = 0.0;
    var bmiWeight: Double = 0.0;
    var results: Double = 0.0;
    var formated: Double = 0.0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        results = (bmiWeight * 703)/(bmiheight * bmiWeight);

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
