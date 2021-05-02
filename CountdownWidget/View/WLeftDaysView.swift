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
                    .font(.system(size: 24))
                HStack{
                    VStack(alignment:.leading){
                        Text("Left")
                        Text(countdownVM.unit)
                    }.font(.system(size: 11))
                    .opacity(0.7)
                    .frame(width: geometry.size.width * 0.2)
                    Text("\(countdownVM.left , specifier: "%0.1f")")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
//                        .aspectRatio(.5, contentMode: .fill)
//                        .padding(.horizontal,0)
                        .foregroundColor(countdownVM.left < 1 || countdownVM.unit == "Hours" ? .green : .red)
                    
                } //: HStack
                .frame(width: geometry.size.width * 0.95,  height:geometry.size.height * 0.5)
            }
            
            .frame(width: geometry.size.width * 0.99,  height:geometry.size.height * 0.99)
            
        }
    }
}


//MARK: - PREVIEW
struct WLeftDaysView_Previews: PreviewProvider {
    static var previews: some View {
        WLeftDaysView(countdownVM: CountdownViewModel())
        .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
