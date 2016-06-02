//
//  settingController.swift
//  tipCalculator
//
//  Created by admin on 6/1/16.
//  Copyright © 2016 NguyenBui. All rights reserved.
//

import UIKit


class settingController: UITableViewController {
    
    //MARK: setting UI.
   
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var tipOutlet: UISwitch!
    
    
    @IBOutlet weak var splitOutlet: UISwitch!
    
    
    @IBOutlet weak var currencyOutlet: UISwitch!
    
    
    @IBAction func tipSwitch(sender: AnyObject) {
        if tipOutlet.on {
            
            print("on")
            defaults.setInteger(1, forKey: "alphaT")
            defaults.setValue(true, forKey: "tipOutletState")
            defaults.synchronize()
        } else {
            defaults.setInteger(0, forKey: "alphaT")
            print("off")
            
            defaults.setValue(false, forKey: "tipOutletState")
            defaults.synchronize()
        }
    }
    
    @IBAction func splitSwitch(sender: AnyObject) {
        if splitOutlet.on {
            defaults.setInteger(1, forKey: "alphaS")
            
            defaults.setBool(true, forKey: "splitOutletState")
            defaults.synchronize()
        } else {
            print("off")
            defaults.setInteger(0, forKey: "alphaS")
            defaults.setBool(false, forKey: "splitOutletState")
            defaults.synchronize()
        }
    }
    
    @IBAction func currencySwitch(sender: AnyObject) {
    
 
        if currencyOutlet.on {
            defaults.setInteger(1, forKey: "alphaC")
            defaults.setBool(true, forKey: "currencyOutletState")
            defaults.synchronize()
        } else {
            print("off")
            defaults.setInteger(0, forKey: "alphaC")
            defaults.setBool(false, forKey: "currencyOutletState")
            defaults.synchronize()
        }
    }
    
    //**********************************************************************************************************************
    
    //MARK: setting defaults
    
    @IBAction func valueChanged(sender: AnyObject) {
        var zeroTotwo = [0, 1, 2]
        var numberData = zeroTotwo[percentageDefault.selectedSegmentIndex]
        
        
        defaults.setInteger(numberData, forKey: "defaultTip")
        defaults.synchronize()
        print(defaults.integerForKey("defaultTip"))
       
    }
    
   
    
    @IBOutlet weak var percentageDefault: UISegmentedControl!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipOutlet.on = defaults.boolForKey("tipOutletState")
        splitOutlet.on = defaults.boolForKey("splitOutletState")
        currencyOutlet.on = defaults.boolForKey("currencyOutletState")
        
        
         percentageDefault.selectedSegmentIndex = defaults.integerForKey("defaultTip")
      
        
        
    }
}
