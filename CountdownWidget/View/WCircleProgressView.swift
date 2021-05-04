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
    //MARK: - BODY
    var body: some View {
         GeometryReader{ geometry in
            ZStack{
                
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(ratio > 0.7 ? .green : .red)
                Circle()
                    .trim(from: 0.0, to: CGFloat( ratio ))
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .rotationEffect(Angle(degrees: 270.0))
                    .foregroundColor(ratio > 0.7 ? .green : .red)
                    .animation(.linear)
                Text(countdownVM.title)
                    .frame(width: geometry.size.width)
                        .font(.system(size: min(geometry.size.height, geometry.size.width) / CGFloat(countdownVM.title.count) / 6 * 10))
                    .background(Color.blue.opacity(0.1))
                    .offset(y:geometry.size.height * -0.36)
                Text("\(ratio * 100, specifier: "%0.1f")%")
                    .font(.system(size:  32.0))
                    .fontWeight(.bold)
                    .opacity(0.6)
            }
            .frame(width: geometry.size.width * 0.7,  height:geometry.size.height * 0.7)
            .offset(x: geometry.size.height * 0.15, y: geometry.size.height * 0.22)
        }
    }
}


//MARK: - PREVIEW
struct WCircleProgressView_Previews: PreviewProvider {
    static var previews: some View {
        
        WCircleProgressView(countdownVM: CountdownViewModel())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
