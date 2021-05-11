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
            VStack(alignment: .center){
                Text(countdownVM.title)
                    
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.system(size: min(geometry.size.height, geometry.size.width) / CGFloat(countdownVM.title.utf16.count + (countdownVM.title.utf8.count - countdownVM.title.count) / 2) / 6 * 8 ))
                    .frame(width: geometry.size.width ,height: geometry.size.height * 0.350)
                    .background(Color.blue.opacity(0.1))
                
                HStack(spacing:0){
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
                        .font(.system(size: 36 * scale))
                        .fontWeight(.bold)
                        .foregroundColor(countdownVM.leftUnit == "Hours" ? .red : .green)
                    
                } //: HStack
                .frame(width: geometry.size.width * 0.95,  height:geometry.size.height * 0.5)
            }
//            
//            .frame(width: geometry.size.width * 0.99,  height:geometry.size.height * 0.99)
            
        }
    }
}


//MARK: - PREVIEW
struct WLeftDaysView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
        WLeftDaysView(countdownVM: CountdownViewModel())
        .previewContext(WidgetPreviewContext(family: .systemSmall))
            WLeftDaysView(countdownVM: CountdownViewModel())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
                .environment(\.colorScheme, .dark)
        WLeftDaysView(countdownVM: CountdownViewModel())
        .previewContext(WidgetPreviewContext(family: .systemMedium))
            WLeftDaysView(countdownVM: CountdownViewModel())
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        WLeftDaysView(countdownVM: CountdownViewModel())
        .previewContext(WidgetPreviewContext(family: .systemLarge))
            WLeftDaysView(countdownVM: CountdownViewModel())
            .previewContext(WidgetPreviewContext(family: .systemLarge))

        }
    }
}
