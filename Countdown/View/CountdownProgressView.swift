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
    //MARK: - BODY
    var body: some View {
        VStack{
            TabView{
                CircleProgressView(countdownVM : countdownVM)
                    .disabled(!countdownVM.dateFromEnabled && !countdownVM.dateToEnabled )
                ElapsedView(countdownVM : countdownVM)
                    .disabled(!countdownVM.dateFromEnabled)
                LeftDaysView(countdownVM : countdownVM)
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
        CountdownProgressView(countdownVM: CountdownViewModel())
//            .environmentObject(CountdownViewModel())
            .previewLayout(.sizeThatFits)
    }
}
