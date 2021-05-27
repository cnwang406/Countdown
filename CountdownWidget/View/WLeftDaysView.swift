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
    @Environment(\.widgetFamily) var widgetFamily
    var scale : CGFloat {
        if widgetFamily == .systemSmall {
            return 1.0
        } else if widgetFamily == .systemMedium {
            return 1.5
        } else {
            return  2.0
        }
    }
    //MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            
            ZStack(alignment: .top){
                Rectangle().frame(width: geometry.size.width  ,height: geometry.size.height * 0.350)
                    .background(Color.blue).opacity(0.1)
                    .shadow(color: .black.opacity(0.5), radius: 1, x: 0.0, y: 0.0)
                Text(countdownVM.title )
//                Text("Tesla is coming")
//                Text("學測來了學測來了學測來了學測來了" )
                    .minimumScaleFactor(0.30)
                    .frame(width: geometry.size.width * 0.95  ,height: geometry.size.height * 0.350)
                    .font(.system(size: min(geometry.size.height, geometry.size.width) / CGFloat(countdownVM.title.utf16.count + (countdownVM.title.utf8.count - countdownVM.title.count) / 2) / 6 * 20 ))
                    
//                    .background(Color.blue.opacity(0.1))
//                    .offset(y:-geometry.size.height * 0.100)

                HStack(alignment:.lastTextBaseline ,spacing:0){
                    
                        Image(countdownVM.iconName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32 * scale)
                        VStack(alignment:.leading){
                            Text("Left")
                            Text(countdownVM.leftUnit)
                        }.font(.system(size: 11 * scale))
                        .opacity(0.7)
                        .frame(width: geometry.size.width * 0.22)
                    
                        
                    Text("\(countdownVM.left , specifier: "%0.1f")")
                        .font(.system(size: 60 * scale))
//                        .fontWeight(.bold)
                        .foregroundColor(countdownVM.leftUnit == "Hours" ? .red : .green)
                    
                } //: HStack
                .minimumScaleFactor(0.50)
                .frame(width: geometry.size.width * 0.95,  height:geometry.size.height * 0.5)
                .offset(y:+geometry.size.height * 0.450)
            }
            
        }
    }
}


//MARK: - PREVIEW
struct WLeftDaysView_Previews: PreviewProvider {
    static var previews: some View {
        
        let cdvm = CountdownViewModel()
        cdvm.title = "Dreams come true"
        
        return Group{
            WLeftDaysView(countdownVM: cdvm)
        .previewContext(WidgetPreviewContext(family: .systemSmall))
            WLeftDaysView(countdownVM: cdvm)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
                .environment(\.colorScheme, .dark)
        WLeftDaysView(countdownVM: cdvm)
        .previewContext(WidgetPreviewContext(family: .systemMedium))
            WLeftDaysView(countdownVM: cdvm)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        WLeftDaysView(countdownVM: cdvm)
        .previewContext(WidgetPreviewContext(family: .systemLarge))
            WLeftDaysView(countdownVM: cdvm)
            .previewContext(WidgetPreviewContext(family: .systemLarge))

        }
    }
}
