//
//  CircleProgressView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/1.
//

import SwiftUI

struct CircleProgressView: View {
    //MARK: - PROPERTIES
    @State var total: Double
    @State var current: Double
    //MARK: - BODY
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(.red)
            Circle()
                .trim(from: 0.0, to: CGFloat( current / total ))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270.0))
                .foregroundColor(.red)
                .animation(.linear)
            Text("\(current / total * 100, specifier: "%0.1f")%")
                .font(.system(size:  40.0))
                .fontWeight(.bold)
                .opacity(0.6)
            
        }
        .frame(width: 200, height:200)
    }
}


//MARK: - PREVIEW
struct CircleProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressView(total: 35, current: 27)
            .previewLayout(.sizeThatFits)
        
    }
}
