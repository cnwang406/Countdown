//
//  ContentView.swift
//  Countdown
//
//  Created by cnwang on 2021/4/29.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
//    @StateObject var countdownVM = CountdownModelView(dateFrom: nil, dateFromEnabled: false, dateTo: nil, dateToEnabled: true)
    
//    let fmt = ISO8601DateFormatter()
    @State var isSettingViewShow: Bool = false
//    var targetDate: Date{
//        let fmt = ISO8601DateFormatter()
//        fmt.timeZone = TimeZone.current
//        return fmt.date(from: "2021-05-29T14:00:00+0800")!
//    }
//
    @StateObject var countdownVM: CountdownViewModel = CountdownViewModel()
    var body: some View {
        NavigationView {
            VStack{
                Image("tesla")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 240, alignment: .center)
                
                Text(countdownVM.title)
                    .font(.title)
                    .padding()

                CountdownProgressView(countdownVM: countdownVM)
//                    .environmentObject(countdownVM)
                Spacer()
                    DateDetailView()
                        .environmentObject(countdownVM)
                    .navigationTitle("Countdown")
                    .navigationBarItems(trailing: Button(action: {
                        isSettingViewShow.toggle()
                    }, label: {
                        Image(systemName: "gearshape")
                    }))
                    
                
            }
            .sheet(isPresented: $isSettingViewShow, onDismiss: {
                
            }, content: {
                SetDateView(countdownVM: countdownVM)
            })
            .padding()
            .onAppear(
                
                
        )
        }
    }
}

//func difference(targetDate: Date) -> (value: Double, unit: String){
//    let fmt = ISO8601DateFormatter()
//    fmt.timeZone = TimeZone.current
//    let target = fmt.date(from: "2021-05-29T14:00:00+0800")!
//    let today = Date()
//    var value: Double = 0.0
//    var unit: String = ""
//    let days = Double(Calendar.current.dateComponents([.day ,.hour], from: today, to: targetDate).day ?? Int(0.0))
//    if days < 3 {
//        let hour = Double(Calendar.current.dateComponents([ .hour], from: today, to: targetDate).hour ?? 0)
//        value = Double(hour)
//
//        unit = "hour"
//
//    } else {
//        let hour = Double(Calendar.current.dateComponents([ .hour], from: today, to: target).hour ?? 0)
//        value = Double(hour / 24 )
//        print ("hour = \(hour)")
//        print ("days = \(days)")
//        print ("value = \(value)")
//        unit = "Days"
//    }
//
//
//    return (value, unit)
//}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
