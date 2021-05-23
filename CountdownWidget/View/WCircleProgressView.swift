//
//  WCircleProgressView.swift
//  CountdownWidgetExtension
//
//  Created by cnwang on 2021/5/2.
//

import SwiftUI
import WidgetKit

struct WCircleProgressView: View {
    //MARK: - PROPERTIES
    @StateObject var countdownVM: CountdownViewModel
    var ratio: Double {
        countdownVM.current / countdownVM.total
    }
    @Environment(\.widgetFamily) var widgetFamily
    var scale : CGFloat {
        if widgetFamily == .systemSmall {
            return 1.0
        } else if widgetFamily == .systemMedium {
            return 1.0
        } else {
            return  2.0
        }
    }
    //MARK: - BODY
    var body: some View {
         GeometryReader{ geometry in
            ZStack(alignment: .top){
                Rectangle().frame(width: geometry.size.width  ,height: geometry.size.height * 0.350)
                    .background(Color.blue).opacity(0.1)
                    .shadow(color: .black.opacity(0.5), radius: 1, x: 0.0, y: 0.0)
                    .offset(y: geometry.size.height * -0.25)

                Circle()
                    .stroke(lineWidth: 15.0 * scale * 0.75)
                    .opacity(0.2)
                    .foregroundColor(ratio > 0.7 ? .green : .red)
                    
                    .frame(width: geometry.size.width * 0.6,  height:geometry.size.height * 0.6)
                    .offset(y: geometry.size.height * 0.14)
                Circle()
                    .trim(from: 0.0, to: CGFloat( ratio ))
                    .stroke(style: StrokeStyle(lineWidth: 15.0 * scale * 0.75, lineCap: .round, lineJoin: .round))
                    .rotationEffect(Angle(degrees: 270.0))
                    .foregroundColor(ratio > 0.7 ? .green : .red)
                    .animation(.linear)
                    .opacity(0.85)
                    .frame(width: geometry.size.width * 0.6,  height:geometry.size.height * 0.6)
                    .offset(y: geometry.size.height * 0.14)
                
                Text(countdownVM.title )
                    .minimumScaleFactor(0.3)
                    .frame(width: geometry.size.width * 0.95 ,height: geometry.size.height * 0.350)
                    .font(.system(size: min(geometry.size.height, geometry.size.width) / CGFloat(countdownVM.title.utf16.count + (countdownVM.title.utf8.count - countdownVM.title.count) / 2) / 6 * 20 ))
                    .offset(y: geometry.size.height * -0.23)

                Text("\(ratio * 100, specifier: "%0.1f")%")
                    .font(.system(size:  32.0 * scale))
//                    .fontWeight(.bold)
                    .opacity(0.6)
                    .offset(y: geometry.size.height * 0.38)
                Image(countdownVM.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width:32 * scale)
                    .offset(y: geometry.size.height * 0.23)
            }
//            .frame(width: geometry.size.width * 1.0,  height:geometry.size.height * 0.7)
//            .offset(x: geometry.size.height * 0.15, y: geometry.size.height * 0.22)
            .offset(y: geometry.size.height * 0.22)
        }
    }
}


//MARK: - PREVIEW
struct WCircleProgressView_Previews: PreviewProvider {
  
    static var previews: some View {
        Group{
            WCircleProgressView(countdownVM: CountdownViewModel())
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            WCircleProgressView(countdownVM: CountdownViewModel())
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            WCircleProgressView(countdownVM: CountdownViewModel())
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
