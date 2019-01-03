//
//  ViewController.swift
//  TipCalculator
//
//  Created by Sandra Q on 6/12/18.
//  Copyright © 2018 Sandra Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //NumberFormatter
    @IBOutlet weak var totalTip: UITextField!
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var totalBill: UILabel!
    
    
    @IBAction func billAmountInput(_ sender: Any) {
        determineTipPercentage()
    }
    @IBAction func tipPercentage(_ sender: UISlider) {
        percentage.text = String(Int(sender.value))+"%"
        determineTipPercentage()
    }
    
    @IBOutlet weak var amountInserted: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func determineTipPercentage() {
        guard let bill = billAmount.text else { return }
        guard let convertBillTotalToDouble = Double(bill)?.rounded() else { return }
        
        let sliderValue = slider.value
        let convertSliderValueToDouble = Double.init(sliderValue)
        let percentageCalculated = convertSliderValueToDouble * convertBillTotalToDouble/100.0
        totalTip.text = String(format:"$%.02f",percentageCalculated)
        let totalBillAmount = convertBillTotalToDouble + percentageCalculated
        totalBill.text =  "Total Bill: " + String(format:"$%.02f",totalBillAmount)
    }
    
    func determineBillFromTipPercentage() {
        return
    }
}
