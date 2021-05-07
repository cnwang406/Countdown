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
    @Published var iconName: String
    
    
    
    var totalDays: Double {
        Double( Calendar.current.dateComponents([.hour], from: dateFrom , to: dateTo ).hour ?? 1) / 24.0
    }
    var total: Double {
        totalDays <= 1.5 ? totalDays * 24 : totalDays
    }
    var currentDays: Double {
        Double( Calendar.current.dateComponents([.hour], from: dateFrom, to: today).hour ?? 0) / 24.0
    }
    var current: Double {
        currentDays <= 1.5 ? currentDays * 24 : currentDays
    }
    
    var left: Double{
        (totalDays - currentDays) < 1.5 ? (totalDays - currentDays) * 24 : (totalDays - currentDays)
    }
    
    var leftUnit: String {
        (totalDays - currentDays) <= 1.5 ? "Hours" : "Days"
    }
    var elapsedUnit: String {
        currentDays <= 1.5 ? "Hours" : "Days"
    }
    
    
    
    var today =  Date()
    
    let fmt = ISO8601DateFormatter()

    init(){
        self.dateFrom =  UserDefaults(suiteName: "group.com.cnwang")?.dateFrom ?? Date()
        self.dateTo = UserDefaults(suiteName: "group.com.cnwang")?.dateTo ?? Date()
        self.dateFromEnabled = UserDefaults(suiteName: "group.com.cnwang")?.dateFromEnabled ?? false
        self.dateToEnabled =  UserDefaults(suiteName: "group.com.cnwang")?.dateToEnabled ?? true
        self.title = UserDefaults(suiteName: "group.com.cnwang")?.title ?? "UNTITLED"
        self.iconName = UserDefaults(suiteName: "group.com.cnwang")?.iconName ?? "tesla.red"
//        self.leftUnit = UserDefaults(suiteName: "group.com.cnwang")?.leftUnit ?? "*Days"
//        self.elapsedUnit = UserDefaults(suiteName: "group.com.cnwang")?.elapsedUnit ?? "*Days"
        print ("CountdownVM init()")
    }
    func save(){
        UserDefaults(suiteName: "group.com.cnwang")?.setValue(self.dateFrom, forKey: "dateFrom")
        UserDefaults(suiteName: "group.com.cnwang")?.setValue(self.dateTo, forKey: "dateTo")
        UserDefaults(suiteName: "group.com.cnwang")?.setValue(self.dateFromEnabled, forKey: "dateFromEnabled")
        UserDefaults(suiteName: "group.com.cnwang")?.setValue(self.dateToEnabled, forKey: "dateToEnabled")
        UserDefaults(suiteName: "group.com.cnwang")?.setValue(self.title, forKey: "title")
        UserDefaults(suiteName: "group.com.cnwang")?.setValue(self.iconName, forKey: "icon")
        print ("CountdownVM save()")
    }
    

    
}
