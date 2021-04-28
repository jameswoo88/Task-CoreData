//
//  Date+Extension.swift
//  Task-CoreData
//
//  Created by James Chun on 4/27/21.
//

import Foundation

extension Date {
    func formatToString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        return formatter.string(from: self)
    }
    
}//End of extension

