//
//  ViewController.swift
//  tips-new
//
//  Created by Lisa Wang on 3/10/15.
//  Copyright (c) 2015 Lisa Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!

    @IBAction func switchToSettings(sender: UIBarButtonItem) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        println("main page did load")
        

    }
    
    
    override func viewWillAppear(animated: Bool) {
        println("main view will appear")
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTip = defaults.objectForKey("defaultTip") as Double
        var defaultTipString = String(format: "%.0f", defaultTip*100) + "%"
        tipControl.setTitle(defaultTipString, forSegmentAtIndex: 0)
        var tipPercentages = [defaultTip, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTip = defaults.objectForKey("defaultTip") as Double
        var tipPercentages = [defaultTip, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
         view.endEditing(true)
    }
    
}

