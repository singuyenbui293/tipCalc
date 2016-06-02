//
//  ViewController.swift
//  tipCalculator
//
//  Created by admin on 5/31/16.
//  Copyright © 2016 NguyenBui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Basic element
    
    let defaults = NSUserDefaults.standardUserDefaults()
    var billamount = 0.0
    let step: Float = 10
    var splitNumber: Double = 1.0
    
    var currencyDict: [String:Double] = [
        
        "$" : 1,
        "vnd" : 22000,
        "€" : 0.9,
        
        ]
    
    
    
    //*****************************************************************************************

    
    
    //MARK: Outlets
    
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet var firstView: UIView!
    
    @IBOutlet weak var thirdView: UIView!
    
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var percentageAmount: UISegmentedControl!
    
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var currencyChange: UISegmentedControl!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    //*****************************************************************************************

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        billAmountTextField.keyboardType = UIKeyboardType.NumberPad
        thirdView.alpha = 0
        secondView.alpha = 0
        tipLabel.alpha = 0
        currencyLabel.alpha = 0
        percentageAmount.alpha =  0
        slider.alpha = 0
        currencyChange.alpha = 0
        tipAmountLabel.alpha = 0
        totalAmountLabel.alpha = 0
        sliderLabel.alpha = 0
        
        sliderLabel.text = "split: 1"
        billAmountTextField.becomeFirstResponder()
        
        
    }
    
    //MARK: take out value from slider
   
    
    @IBAction func sliderChanged(sender: UISlider) {
        
        splitNumber = Double(round(sender.value))
        
        sliderLabel.text = "split: \(splitNumber)"
        

    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let index = defaults.integerForKey("defaultTip")
        
        billAmountTextField.text = ""
        percentageAmount.selectedSegmentIndex = index
        thirdView.alpha = 0
        secondView.alpha = 0
        tipLabel.alpha = 0
        currencyLabel.alpha = 0
        percentageAmount.alpha =  0
        slider.alpha = 0
        currencyChange.alpha = 0
        tipAmountLabel.alpha = 0
        totalAmountLabel.alpha = 0
        sliderLabel.alpha = 0
        
        sliderLabel.text = "split: 1"
        
    }
    
    //MARK: main calculation 
    
    @IBAction func enterBillAmount(sender: AnyObject) {
        
        //MARK: Tip element
        
        var percentages = [0.1, 0.15, 0.2]
        let percentage = percentages[percentageAmount.selectedSegmentIndex]
        
        
        //MARK: currency element
        
        let key = Array(currencyDict.keys)[currencyChange.selectedSegmentIndex]
        let value = currencyDict[key]
        
        
        
        print(key)
        print(value)
        
        //MARK: calculations update total and tip label
        
        if let amount = billAmountTextField.text {
            billamount = (amount as NSString).doubleValue
            
        }
        let ToAmount = billamount * (1 + percentage)
        
        tipAmountLabel.text = "+   \(key)     \((billamount * percentage / splitNumber) * value! )"
        totalAmountLabel.text = "=   \(key)     \((ToAmount / splitNumber) * value! )"
        
        tipAmountLabel.adjustsFontSizeToFitWidth = true
        tipAmountLabel.textAlignment = NSTextAlignment.Center
        
        totalAmountLabel.adjustsFontSizeToFitWidth = true
        totalAmountLabel.textAlignment = NSTextAlignment.Center
        
        //MARK: animation when text fill
        
        if checkTextField() {
            let alphaTint = defaults.integerForKey("alphaT")
            let alphaSint = defaults.integerForKey("alphaS")
            let alphaCint = defaults.integerForKey("alphaC")
            
            let alphaT: CGFloat = CGFloat(alphaTint)
            let alphaS: CGFloat = CGFloat(alphaSint)
            let alphaC: CGFloat = CGFloat(alphaCint)
            
            
            print(alphaTint)
            print(alphaSint)
            print(alphaCint)
            calUI(1)
            tipUI(alphaT)
            splitUI(alphaS)
            currencyUI(alphaC)
        }
        
    }
    
    func checkTextField() ->  Bool {
        if (!(billAmountTextField.text?.isEmpty)!)  {
            return true
        } else {
            print("The Field is Emtpy ")
            calUI(0)
            tipUI(0)
            splitUI(0)
            currencyUI(0)
            
            return false
        }
    }
    
  //MARK: UI func
    
    func calUI (alpha: CGFloat) {
        UIView.animateWithDuration(1, animations: {
            self.secondView.alpha = alpha
            self.thirdView.alpha = alpha
            self.tipAmountLabel.alpha = alpha
            self.totalAmountLabel.alpha = alpha
            
        })
    }
    
    func calDefaultUI (alphaD :  CGFloat) {
        
    }
    
    func tipUI (alphaT : CGFloat ) {
        UIView.animateWithDuration(1, animations: {
            self.tipLabel.alpha = alphaT
            self.percentageAmount.alpha = alphaT
        })
    }
    
    func splitUI (alphaS : CGFloat) {
        UIView.animateWithDuration(1, animations: {
            self.slider.alpha = alphaS
            self.sliderLabel.alpha = alphaS
        })
    }
    
    func currencyUI (alphaC : CGFloat) {
        UIView.animateWithDuration(1, animations: {
            self.currencyLabel.alpha = alphaC
            self.currencyChange.alpha = alphaC
        })
    }
    @IBAction func tap(sender: AnyObject) {
        view.endEditing(true)
    }
    
        
    //*****************************************************************************************

}

