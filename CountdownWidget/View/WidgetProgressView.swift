//
//  WidgetProgressView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/1.
//

import SwiftUI
import WidgetKit
struct WidgetProgressView: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var countdownVM: CountdownViewModel
    //MARK: - BODY
    var body: some View {
        ZStack{
            Color.blue.opacity(0.3)
            if countdownVM.dateFromEnabled && countdownVM.dateToEnabled {
                VStack{
                    //                Text("\(countdownVM.dateFromEnabled.description) \(countdownVM.dateToEnabled.description)")
                    WCircleProgressView(countdownVM : countdownVM)
                }
            } else if !countdownVM.dateFromEnabled && countdownVM.dateToEnabled {
                VStack{
                    //                Text("\(countdownVM.dateFromEnabled.description) \(countdownVM.dateToEnabled.description)")
                    WLeftDaysView(countdownVM : countdownVM)
                }
            } else {
                VStack{
                    //                Text("\(countdownVM.dateFromEnabled.description) \(countdownVM.dateToEnabled.description)")
                    WElpasedView(countdownVM : countdownVM)
                }
            }
        }
        
    }
}


//MARK: - PREVIEW
struct WidgetProgressView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetProgressView()
            //            .environmentObject(CountdownViewModel())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
