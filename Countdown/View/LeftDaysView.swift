//
//  LeftDaysView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/1.
//

import SwiftUI

struct LeftDaysView: View {
    //MARK: - PROPERTIES
    @StateObject var countdownVM: CountdownViewModel
    //MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            VStack{
                
                HStack{
                    VStack{
                        Text("Left")
                        Text(countdownVM.unit)
                    }.padding(.vertical, 20)
                    .font(.system(size: 20))
                    Text("\(countdownVM.left , specifier: "%0.1f")")
                        .font(.system(size: 72))
                        .fontWeight(.bold)
//                    Spacer()
                        .font(.system(size: 40))
                }
            }.frame(width: geometry.size.width, height: 150, alignment: .center)
        }
    }
}


//MARK: - PREVIEW
struct LeftDaysView_Previews: PreviewProvider {
    static var previews: some View {
        LeftDaysView(countdownVM: CountdownViewModel())
            .previewLayout(.sizeThatFits)
    }
}
