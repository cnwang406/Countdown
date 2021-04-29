//
//  ContentView.swift
//  Countdown
//
//  Created by cnwang on 2021/4/29.
//

import SwiftUI
import Foundation

struct ContentView: View {
    let fmt = ISO8601DateFormatter()

    var targetDate: Date{
        let fmt = ISO8601DateFormatter()
        fmt.timeZone = TimeZone.current
        return fmt.date(from: "2021-05-29T14:00:00+0800")!
    }
    var body: some View {
        VStack{
            Image("tesla")
                .resizable()
                .scaledToFit()
                .frame(width: 240, height: 240, alignment: .center)
            
            Text("Tesla is coming...")
                .font(.title)
                .padding()
            HStack(alignment:.bottom){
                Text("\(difference(targetDate: targetDate).value, specifier: "%0.0f")")
                    .font(.system(size: 120))
                    .fontWeight(.bold)
                Text("\(difference(targetDate: targetDate).unit)")
                    .font(.title)
                
            }
            Spacer()
            
        }
        .padding()
        .onAppear(
            
            
        )
    }
}

func difference(targetDate: Date) -> (value: Double, unit: String){
    let fmt = ISO8601DateFormatter()
    fmt.timeZone = TimeZone.current
    let target = fmt.date(from: "2021-05-29T14:00:00+0800")!
    let today = Date()
    var value: Double = 0.0
    var unit: String = ""
    let days = Double(Calendar.current.dateComponents([.day ,.hour], from: today, to: targetDate).day ?? Int(0.0))
    if days < 3 {
        let hour = Double(Calendar.current.dateComponents([ .hour], from: today, to: targetDate).hour ?? 0)
        value = Double(hour)
        
        unit = "hour"
        
    } else {
        let hour = Double(Calendar.current.dateComponents([ .hour], from: today, to: target).hour ?? 0)
        value = Double(hour / 24 )
        print ("hour = \(hour)")
        print ("days = \(days)")
        print ("value = \(value)")
        unit = "Days"
    }
    
    
    return (value, unit)
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
