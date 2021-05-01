//
//  WidgetProgressView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/1.
//

import SwiftUI

struct WidgetProgressView: View {
    //MARK: - PROPERTIES
    
    @EnvironmentObject var countdownVM: CountdownViewModel
    
    //MARK: - BODY
    var body: some View {
        if countdownVM.dateFromEnabled && countdownVM.dateToEnabled {
            VStack{
                Text("\(countdownVM.dateFromEnabled.description) \(countdownVM.dateToEnabled.description)")
                CircleProgressView(total: countdownVM.total, current: countdownVM.current)
            }
        } else if countdownVM.dateToEnabled && !countdownVM.dateToEnabled {
            VStack{
                Text("\(countdownVM.dateFromEnabled.description) \(countdownVM.dateToEnabled.description)")
                LeftDaysView(leftDays: countdownVM.left, unit: "Days")
            }
        } else {
            VStack{
                Text("\(countdownVM.dateFromEnabled.description) \(countdownVM.dateToEnabled.description)")
                ElapsedView(elapsedDays:  countdownVM.total - countdownVM.current, unit: "Days")
            }
        }
        
    }
}


//MARK: - PREVIEW
struct WidgetProgressView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetProgressView()
    }
}
