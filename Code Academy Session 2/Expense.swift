//
//  Expense.swift
//  Code Academy Session 2
//
//  Created by eugene on 26/03/2018.
//  Copyright © 2018 eugene. All rights reserved.
//

import UIKit

struct Expense: Codable {
    
    let amount: Double
    let type: String
    let date: Date
    let location: String
    let comment: String
    
    init(cost amount: Double, of type: String, on date: Date, in location: String, note comment: String) {
        self.amount = amount
        self.type = type
        self.date = date
        self.location = location
        self.comment = comment 
    }
    
    func convertDataToString() -> String {
        let dateString = date.toString()
        return "Amount: \(amount), Type: \(type), date: \(dateString), location: \(location), comment: \(comment)"
    }
}

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: self)
    }
}
