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
        loadBillValue()
        billField.becomeFirstResponder()
        loadDefaultTip()
        calculateTip(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //print("view will appear")
        loadBillValue()
        loadDefaultTip()
        calculateTip(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
    }

    
    @IBAction func calculateTip(_ sender: Any) {
        persistBillValue()
        let tipPercentage = [0.18,0.2,0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill+tip
        
        //tipLabel.text = "$\(tip)"
        //totalLabel.text = "$\(total)"
        //tipLabel.text = String(format:getCurrencySymbol()+"%.2f", tip)
        //totalLabel.text = String(format:getCurrencySymbol()+"%.2f", total)
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        currencyFormatter.locale = NSLocale.current
        tipLabel.text = currencyFormatter.string(from: tip as NSNumber)
        totalLabel.text = currencyFormatter.string(from: total as NSNumber)
    }
    func loadDefaultTip()
    {
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "tipIndex")
        tipControl.selectedSegmentIndex = intValue
    }
    
    func persistBillValue() {
        let defaults = UserDefaults.standard
        defaults.set(billField.text, forKey: "billValue")
        defaults.synchronize()
    }
    
    func loadBillValue()
    {
        let defaults = UserDefaults.standard
        let billValue = defaults.string(forKey: "billValue")
        billField.text = billValue
    }
}

