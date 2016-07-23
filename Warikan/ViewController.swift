//
//  ViewController.swift
//  Warikan
//
//  Created by miminashi on 2016/07/23.
//  Copyright © 2016年 miminashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var totalAmountField: UITextField!
    @IBOutlet weak var studentPaymentAmountField: UITextField!
    @IBOutlet weak var studentNumberLabel: UILabel!
    @IBOutlet weak var workerNumberLabel: UILabel!
    @IBOutlet weak var studentNumberStepper: UIStepper!
    @IBOutlet weak var workerNumberStepper: UIStepper!
    @IBOutlet weak var workerPaymentAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initializeViewData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeViewData() {
        // Initialize studentNumberStepper
        studentNumberStepper.value = 0
        studentNumberStepper.minimumValue = 0
        studentNumberStepper.stepValue = 1
        
        // Initialize workerNumberStepper
        workerNumberStepper.value = 1
        workerNumberStepper.minimumValue = 1
        workerNumberStepper.stepValue = 1
    }
    
    func calculate() {
        let totalAmount = Int(totalAmountField.text!)
        let studentPayment = Int(studentPaymentAmountField.text!)
        
        let studentNumber = Int(studentNumberStepper.value)
        studentNumberLabel.text = String(format: "%d", studentNumber)
        let workerNumber = Int(workerNumberStepper.value)
        workerNumberLabel.text = String(format: "%d", workerNumber);
        
        if let _totalAmount = totalAmount, _studentPayment = studentPayment {
            let result = (_totalAmount - _studentPayment * studentNumber) / workerNumber
            workerPaymentAmountLabel.text = String(format: "%d", result)
        }
        else {
            workerPaymentAmountLabel.text = "Error"
        }

        
    }

    @IBAction func totalAmountFieldEditingDidEnd(sender: AnyObject) {
        calculate()
    }
    
    @IBAction func studentNumberFieldEditingDidEnd(sender: AnyObject) {
        calculate()
    }
    
    @IBAction func studentNumberStepperValueChanged(sender: AnyObject) {
        calculate()
    }

    @IBAction func workerNumberStepperValueChanged(sender: AnyObject) {
        calculate()
    }

    @IBAction func viewDidTap(sender: AnyObject) {
        totalAmountField.resignFirstResponder()
        studentPaymentAmountField.resignFirstResponder()
    }
}
