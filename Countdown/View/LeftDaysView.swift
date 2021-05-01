//
//  LeftDaysView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/1.
//

import SwiftUI

struct LeftDaysView: View {
    //MARK: - PROPERTIES
    @State var leftDays: Double
    @State var unit: String
    //MARK: - BODY
    var body: some View {
        VStack{
            
            Text("Elapsed")
                .font(.system(size: 20))
            Text("\(leftDays, specifier: "%0.1f")")
                .font(.system(size: 72))
                .fontWeight(.bold)
            HStack{
                Spacer()
                Text(unit)
                .font(.system(size: 40))
            }
        }.frame(width: 100, height: 100, alignment: .center)
    }
}


//MARK: - PREVIEW
struct LeftDaysView_Previews: PreviewProvider {
    static var previews: some View {
        LeftDaysView(leftDays: 60, unit: "Days")
            .previewLayout(.sizeThatFits)
    }
}
