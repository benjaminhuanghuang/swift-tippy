//
//  ViewController.swift
//  tippy
//
//  Created by Huang Huang on 2/28/17.
//  Copyright © 2017 BenjaminHuang. All rights reserved.
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
        
        loadDefaultTip()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //print("view will appear")
        loadDefaultTip()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
    }

   
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentage = [0.18,0.2,0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill+tip
        
        //tipLabel.text = "$\(tip)"
        //totalLabel.text = "$\(total)"
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
    }
    func loadDefaultTip()
    {
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "tipIndex")
        tipControl.selectedSegmentIndex = intValue
    }
}

