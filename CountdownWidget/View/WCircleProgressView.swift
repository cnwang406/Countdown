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
            ZStack{
                Circle()
                    .stroke(lineWidth: 20.0 * scale * 0.75)
                    .opacity(0.2)
                    .foregroundColor(ratio > 0.7 ? .green : .red)
                    .frame(width: geometry.size.width * 0.6,  height:geometry.size.height * 0.6)
                    .offset(y: 10)
                Circle()
                    .trim(from: 0.0, to: CGFloat( ratio ))
                    .stroke(style: StrokeStyle(lineWidth: 20.0 * scale * 0.75, lineCap: .round, lineJoin: .round))
                    .rotationEffect(Angle(degrees: 270.0))
                    .foregroundColor(ratio > 0.7 ? .green : .red)
                    .animation(.linear)
                    .opacity(0.85)
                    .frame(width: geometry.size.width * 0.6,  height:geometry.size.height * 0.6)
                    .offset(y: 10)
                Text(countdownVM.title )
                    .frame(width: geometry.size.width)
                    .font(.system(size: min(geometry.size.height, geometry.size.width) / CGFloat(countdownVM.title.count) / 6 * 10))
                    .background(Color.blue.opacity(0.1))
                    .offset(y:geometry.size.height * -0.36 )
                Text("\(ratio * 100, specifier: "%0.1f")%")
                    .font(.system(size:  32.0 * scale))
                    .fontWeight(.bold)
                    .opacity(0.6)
                    .offset(y: 18 * scale)
                Image(countdownVM.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width:32 * scale)
                    .offset(y:-10 * scale)
            }
            .frame(width: geometry.size.width * 1.0,  height:geometry.size.height * 0.7)
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
