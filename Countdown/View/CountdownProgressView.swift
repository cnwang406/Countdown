//
//  ProgressView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/1.
//

import SwiftUI

struct CountdownProgressView: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var countdownVM: CountdownViewModel
    @State var message: String = ""
    //MARK: - BODY
    var body: some View {
        VStack{
            TabView{
                CircleProgressView(total: countdownVM.total, current: countdownVM.current)
                    .disabled(!countdownVM.dateFromEnabled && !countdownVM.dateToEnabled )
                ElapsedView(elapsedDays:  countdownVM.total - countdownVM.current, unit: "Days")
                    .disabled(!countdownVM.dateFromEnabled)
                LeftDaysView(leftDays: countdownVM.left, unit: "Days")
                        .disabled(!countdownVM.dateToEnabled)
            }.tabViewStyle(PageTabViewStyle())
        }
        .onAppear(perform: {
            if countdownVM.dateFromEnabled && countdownVM.dateToEnabled {
                message = "Circle progress"
                
            } else if countdownVM.dateFromEnabled && !countdownVM.dateToEnabled{
                message = "Elapsed progress"
            } else if !countdownVM.dateFromEnabled && countdownVM.dateToEnabled {
                message = "Left days"
            }
        })
    }
    
}


//MARK: - PREVIEW
struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownProgressView()
            .environmentObject(CountdownViewModel())
            .previewLayout(.sizeThatFits)
    }
}
