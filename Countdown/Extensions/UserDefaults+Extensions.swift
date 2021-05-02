//
//  UserDefaults+Extensions.swift
//  Countdown
//
//  Created by cnwang on 2021/4/30.
//

import Foundation

extension UserDefaults {
    var dateFrom: Date {
        guard let value = self.value(forKey: "dateFrom") as? Date else {
            return Date()
        }
        return value
    }
    var dateTo: Date {
        guard let value = self.value(forKey: "dateTo") as? Date else {
            return Date()
        }
        return value
    }
    var dateToEnabled: Bool {
    guard let value = self.value(forKey: "dateToEnabled") as? Bool else {
            return true
        }
        return value
    }
    var dateFromEnabled: Bool {
    guard let value = self.value(forKey: "dateFromEnabled") as? Bool else {
            return false
        }
        return value
    }
    var title: String {
        guard let value = self.value(forKey: "title") as? String else {
            return "UNTITLED"
        }
        return value
    }
    
}
