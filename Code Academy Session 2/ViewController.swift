//
//  ViewController.swift
//  Code Academy Session 2
//
//  Created by eugene on 25/03/2018.
//  Copyright © 2018 eugene. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var amountField: UITextField!
    @IBOutlet private weak var typeField: UITextField!
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var locationField: UITextField!
    @IBOutlet private weak var commentView: UITextView!
    @IBOutlet private weak var hidenTextField: UITextView!
    
    
    private let jsonEncoder = JSONEncoder()
    private let jsonDecoder = JSONDecoder()
    
    @IBOutlet private var arrOfRequiredFields: [UITextField]!
    func areRequiredFieldsFilled() -> Bool {
        var everythingIsFilled = true
        for field in arrOfRequiredFields {
            guard let unwrapedValue = field.text, unwrapedValue != "" else {
                renderRedRec(on: field)
                everythingIsFilled = false
                continue
            }
        } 
        return everythingIsFilled
    }
    
    @IBAction private func sendRequest(_ sender: UIButton) {
        if areRequiredFieldsFilled() {
            guard let amount = amountField.text else {
                return
            }
            guard let type = typeField.text else {
                return
            }
            guard let location = locationField.text else {
                return
            }
            let comment = commentView.text
            let date = datePicker.date
            
            let expnese = Expense(cost: Double(amount)!, of: type, on: date, in: location, note: comment!)
            try! converToJsonAndSendData(expnese)
            hidenTextField.isHidden = false
        }
    }
    
    private func renderRedRec(on textField: UITextField) {
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.red.cgColor
    }
    
    private func converToJsonAndSendData(_ data: Expense) throws {
        let jsonData = try jsonEncoder.encode(data)
        let expense = try jsonDecoder.decode(Expense.self, from: jsonData)
        hidenTextField.text = expense.convertDataToString()
    }
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        commentView.isScrollEnabled = false
        hidenTextField.isScrollEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

