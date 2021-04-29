//
//  ContentView.swift
//  Countdown
//
//  Created by cnwang on 2021/4/29.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    var body: some View {
        VStack{
            Text("Gotcha Tesla")
                .font(.headline)
                .padding()
            HStack(alignment:.bottom){
                Text("\(difference())")
                .font(.title)
                    .fontWeight(.bold)
                Text("Days")
                    .font(.caption)
            }
        }
        .padding()
        .onAppear(
            
        )
    }
}

func difference() -> String{
    let fmt = ISO8601DateFormatter()
    fmt.timeZone = TimeZone.current
    let target = fmt.date(from: "2021-05-2T14:00:00+0800")!
    let today = Date()
    var outs = ""
    let days = Calendar.current.dateComponents([.day ,.hour], from: today, to: target).day!
    if days < 7 {
        let hour = Double(Calendar.current.dateComponents([.day ,.hour], from: today, to: target).hour ?? 0)
        outs = "\(days).\(Int(hour / 24 * 10) )"
    } else {
        outs = "\(days)"
    }
    print ("\(fmt.string(from: today))")
    print (outs)
    return String(outs)
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
