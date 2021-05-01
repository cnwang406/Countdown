//
//  ElapsedView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/1.
//

import SwiftUI

struct ElapsedView: View {
    //MARK: - PROPERTIES
    @State var elapsedDays: Double
    @State var unit: String
    //MARK: - BODY
    var body: some View {
        VStack{
            
            Text("Elapsed")
                .font(.system(size: 20))
            Text("\(elapsedDays, specifier: "%0.1f")")
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
struct ElapsedView_Previews: PreviewProvider {
    static var previews: some View {
        ElapsedView(elapsedDays: 42.0, unit: "Hours")
            .previewLayout(.sizeThatFits)
    }
}
