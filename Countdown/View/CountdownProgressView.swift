//
//  ProgressView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/1.
//

import SwiftUI

struct CountdownProgressView: View {
    //MARK: - PROPERTIES
    //    @EnvironmentObject var countdownVM: CountdownViewModel
    @ObservedObject var countdownVM: CountdownViewModel
    @State var message: String = ""
    @State var activeTab = 0
    //MARK: - BODY
    var body: some View {
        VStack{
            TabView(selection: $countdownVM.activateTab){
                CircleProgressView(countdownVM : countdownVM)
                    .disabled(!countdownVM.dateFromEnabled && !countdownVM.dateToEnabled )
                    .tag(0)
                ElapsedView(countdownVM : countdownVM)
                    .disabled(!countdownVM.dateFromEnabled)
                    .tag(1)
                LeftDaysView(countdownVM : countdownVM)
                    .disabled(!countdownVM.dateToEnabled)
                    .tag(2)
            }.tabViewStyle(PageTabViewStyle())
        }
        .animation(.easeInOut)
//        .onAppear(perform: {
//            if countdownVM.dateFromEnabled && countdownVM.dateToEnabled {
//                activeTab = 0
//                message = "Circle progress"
//            } else if countdownVM.dateFromEnabled && !countdownVM.dateToEnabled{
//                activeTab = 1
//                message = "Elapsed progress"
//            } else if !countdownVM.dateFromEnabled && countdownVM.dateToEnabled {
//                activeTab = 2
//                message = "Left days"
//            }
//        })
    }
    
}


//MARK: - PREVIEW
struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownProgressView(countdownVM: CountdownViewModel())
            //            .environmentObject(CountdownViewModel())
            .previewLayout(.sizeThatFits)
    }
}
