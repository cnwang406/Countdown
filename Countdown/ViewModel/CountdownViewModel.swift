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
        Double( Calendar.current.dateComponents([.hour], from: dateFrom , to: dateTo ).hour ?? 1) / 24.0
    }
    var current: Double {
        Double( Calendar.current.dateComponents([.hour], from: dateFrom, to: today).hour ?? 0) / 24.0
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
    func save(){
        UserDefaults(suiteName: "group.com.cnwang")?.setValue(self.dateFrom, forKey: "dateFrom")
        UserDefaults(suiteName: "group.com.cnwang")?.setValue(self.dateTo, forKey: "dateTo")
        UserDefaults(suiteName: "group.com.cnwang")?.setValue(self.dateFromEnabled, forKey: "dateFromEnabled")
        UserDefaults(suiteName: "group.com.cnwang")?.setValue(self.dateToEnabled, forKey: "dateToEnabled")
        UserDefaults(suiteName: "group.com.cnwang")?.setValue(self.title, forKey: "title")
        
    }
    

    
}
