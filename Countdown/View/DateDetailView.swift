//
//  DateDetailView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/1.
//

import SwiftUI
import WidgetKit
struct DateDetailView: View {
    //MARK: - PROPERTIES
    @StateObject var countdownVM: CountdownViewModel
    //MARK: - BODY
    var body: some View {
        VStack(spacing: 10){
            HStack {
                //            Text ("From")
                
                //            Text(countdownVM.dateFrom.toString())
                DatePicker("Start from", selection: $countdownVM.dateFrom)
                    .foregroundColor(countdownVM.dateFromEnabled ? .blue : .gray)
                    .onTapGesture(perform: {
                        countdownVM.dateFromEnabled.toggle()
                        if !countdownVM.dateToEnabled && !countdownVM.dateFromEnabled {
                            countdownVM.dateFromEnabled.toggle()
                        }
                        print ("reload timeline")
                        countdownVM.save()
                        WidgetCenter.shared.reloadAllTimelines()
                    })
                    .onChange(of: countdownVM.dateFrom) { Equatable in
                        print("onChange: \(Equatable)")
                        print ("reload timeline")
                        countdownVM.save()
                        WidgetCenter.shared.reloadAllTimelines()
                    }
                
                
            }
//            Spacer()
            HStack (spacing: 10){
                //                Text ("To")
//                Spacer()
                //                Text(countdownVM.dateTo.toString())
                DatePicker("End at", selection: $countdownVM.dateTo)
                    .foregroundColor(countdownVM.dateToEnabled ? .blue : .gray)
                    .onTapGesture(perform: {
                        countdownVM.dateToEnabled.toggle()
                        if !countdownVM.dateToEnabled && !countdownVM.dateFromEnabled {
                            countdownVM.dateToEnabled.toggle()
                        }
                        print ("reload timeline")
                        countdownVM.save()
                        WidgetCenter.shared.reloadAllTimelines()
                        
                    })
                    .onChange(of: countdownVM.dateTo) { Equatable in
                        print ("reload timeline")
                        countdownVM.save()
                        WidgetCenter.shared.reloadAllTimelines()
                    }
//                Spacer()
            }
            
//            Text("\(countdownVM.dateFrom.description)")
//            Text("\(countdownVM.dateTo.description)")
            
        }
        .padding()
        
        
    }
}


//MARK: - PREVIEW
struct DateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DateDetailView(countdownVM: CountdownViewModel())
            .previewLayout(.sizeThatFits)
    }
}
