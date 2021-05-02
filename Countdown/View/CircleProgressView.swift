//
//  CircleProgressView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/1.
//

import SwiftUI

struct CircleProgressView: View {
    //MARK: - PROPERTIES
//    var total: Double
//    var current: Double
    @StateObject var countdownVM: CountdownViewModel
    //MARK: - BODY
    var body: some View {
//        self.total = countdownVM.total
//        self.current = countdownVM.current
//
         GeometryReader{ geometry in
            ZStack{
                Circle()
                    .stroke(lineWidth: 15.0)
                    .opacity(0.3)
                    .foregroundColor(.red)
                    .frame(width: geometry.size.width, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Circle()
                    .trim(from: 0.0, to: CGFloat( countdownVM.current / countdownVM.total ))
                    .stroke(style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                    .frame(width: geometry.size.width, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .rotationEffect(Angle(degrees: 270.0))
                    .foregroundColor(.red)
                    .animation(.linear)
                Text("\(countdownVM.current / countdownVM.total * 100, specifier: "%0.1f")%")
                    .font(.system(size:  36.0))
                    .fontWeight(.bold)
                    .opacity(0.6)
//                Text("w\(geometry.size.width) h\(geometry.size.height)")
                
            }
            .frame(width: geometry.size.width,  height:150)
        }
    }
}


//MARK: - PREVIEW
struct CircleProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressView(countdownVM: CountdownViewModel())
            .previewLayout(.sizeThatFits)
        
    }
}
