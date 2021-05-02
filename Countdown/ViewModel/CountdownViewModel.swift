//
//  CountdownModelView.swift
//  Countdown
//
//  Created by cnwang on 2021/4/30.
//

import Foundation

class CountdownViewModel: ObservableObject{
    
    @Published var dateFrom: Date
    @Published var dateTo: Date
    @Published var dateFromEnabled: Bool
    @Published var dateToEnabled: Bool
    @Published var title: String
    
    var total: Double {
        Double( Calendar.current.dateComponents([.day], from: dateFrom , to: dateTo ).day ?? 1)
    }
    var current: Double {
        Double( Calendar.current.dateComponents([.day], from: dateFrom, to: today).day ?? 0)
    }
    var left: Double{
        total - current
    }
    @Published var unit: String
    
    var today =  Date()
    
    let fmt = ISO8601DateFormatter()

    init(){
        self.dateFrom =  UserDefaults(suiteName: "group.com.cnwang")?.dateFrom ?? Date()
        self.dateTo = UserDefaults(suiteName: "group.com.cnwang")?.dateTo ?? Date()
        self.dateFromEnabled = UserDefaults(suiteName: "group.com.cnwang")?.dateFromEnabled ?? false
        self.dateToEnabled =  UserDefaults(suiteName: "group.com.cnwang")?.dateToEnabled ?? true
        self.title = UserDefaults(suiteName: "group.com.cnwang")?.title ?? "UNTITLED"
        self.unit = "Days"
    }
    var targetDate: Date{
        let fmt = ISO8601DateFormatter()
        fmt.timeZone = TimeZone.current
        return fmt.date(from: "2021-05-29T14:00:00+0800")!
    }
    
    
//    func midWay() -> Double {
//        let total = Double( Calendar.current.dateComponents([.minute], from: dateFrom ?? today, to: dateTo ?? today).minute ?? 1)
////        print (total)
//        let finished = Double( Calendar.current.dateComponents([.minute], from: dateFrom ?? today, to: today).minute ?? 0)
//        print (" from \(String(describing: dateFrom.description)) to \(String(describing: dateTo.description)) = \(finished) / \(total)")
//
//        self.total = total
//        self.current = finished
//        return finished / total
//    }
//
//    func left() -> (value: Double, unit: String) {
//        var unit: String = ""
//        var value: Double = 0
//        print ("left : from \(dateFrom) -> \(dateTo)")
//        let minLeft = Double( Calendar.current.dateComponents([.minute], from: dateFrom ?? today, to: dateTo ?? today).minute ?? 0)
//
//        if minLeft > 1440 * 2 { // > 2 day
//            value = Double( Int(minLeft / 1440 * 10 ) / 10)
//            unit = "Days"
//        } else if minLeft > 60 { // hour
//            value = Double( Int(minLeft / 60 * 10 ) / 10)
//            unit = "Hour"
//        } else {
//            value = Double( Int(minLeft / 60 * 10 ) / 10)
//            unit = "Minute"
//        }
//        print (" = \(value) \(unit)")
//        self.left = value
//        self.unit = unit
//        return (value, unit)
//    }
    
}
