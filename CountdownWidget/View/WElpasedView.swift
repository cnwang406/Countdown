//
//  WElpasedView.swift
//  CountdownWidgetExtension
//
//  Created by cnwang on 2021/5/2.
//

import SwiftUI
import WidgetKit
struct WElpasedView: View {
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
                        Text("Elapsed")
                        Text(countdownVM.unit)
                    }.font(.system(size: 11))
                    .opacity(0.7)
                    .frame(width: geometry.size.width * 0.3)
                    Text("\(countdownVM.current, specifier: "%0.1f")")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
//                        .aspectRatio(.5, contentMode: .fill)
//                        .padding(.horizontal,0)
                    
                } //: HStack
                .frame(width: geometry.size.width * 0.95,  height:geometry.size.height * 0.5)
            }
            
            .frame(width: geometry.size.width * 0.99,  height:geometry.size.height * 0.99)
            
        }
    }
}


//MARK: - PREVIEW
struct WElpasedView_Previews: PreviewProvider {
    static var previews: some View {
        WElpasedView(countdownVM: CountdownViewModel())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
