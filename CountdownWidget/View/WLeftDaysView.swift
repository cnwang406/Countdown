//
//  WLeftDaysView.swift
//  CountdownWidgetExtension
//
//  Created by cnwang on 2021/5/2.
//

import SwiftUI
import WidgetKit
struct WLeftDaysView: View {
    //MARK: - PROPERTIES
    @StateObject var countdownVM: CountdownViewModel
    //MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center){
                Text(countdownVM.title)
                    .frame(width: geometry.size.width)
                        .font(.system(size: min(geometry.size.height, geometry.size.width) / CGFloat(countdownVM.title.count) / 6 * 10))
                    .background(Color.blue.opacity(0.1))
                    
                HStack(spacing:0){
                    Image("tesla-480")
                        .resizable()
                        .scaledToFit()
                        .frame(width:32)
                    VStack(alignment:.leading){
                        Text("Left")
                        Text(countdownVM.leftUnit)
                    }.font(.system(size: 11))
                    .opacity(0.7)
                    .frame(width: geometry.size.width * 0.22)
                    Text("\(countdownVM.left , specifier: "%0.1f")")
                        .font(.system(size: 36))
                        .fontWeight(.bold)
                        .foregroundColor(countdownVM.leftUnit == "Hours" ? .red : .green)
                    
                } //: HStack
                .frame(width: geometry.size.width * 0.95,  height:geometry.size.height * 0.5)
            }
            
            .frame(width: geometry.size.width * 0.99,  height:geometry.size.height * 0.99)
            
        }.onAppear(perform: {
            print ("WLeftDaysView .onAppear()")
        })
    }
}


//MARK: - PREVIEW
struct WLeftDaysView_Previews: PreviewProvider {
    static var previews: some View {
        WLeftDaysView(countdownVM: CountdownViewModel())
        .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
