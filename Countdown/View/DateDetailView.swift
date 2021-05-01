//
//  DateDetailView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/1.
//

import SwiftUI

struct DateDetailView: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var countdownVM: CountdownViewModel
    //MARK: - BODY
    var body: some View {
        VStack{
        HStack {
            Text ("From")
                Spacer()
            Text(countdownVM.dateFrom.toString())
                .foregroundColor(countdownVM.dateFromEnabled ? .blue : .gray)
            
        }
            Spacer()
            HStack {
                Text ("To")
                Spacer()
                Text(countdownVM.dateTo.toString())
                    .foregroundColor(countdownVM.dateToEnabled ? .blue : .gray)
                
            }
            
        }
        .padding()
        .frame(width: 250, height: 60, alignment: .center)
        
    }
}


//MARK: - PREVIEW
struct DateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DateDetailView()
            .environmentObject(CountdownViewModel())
            .previewLayout(.sizeThatFits)
    }
}
