//
//  SelectIconView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/7.
//

import SwiftUI

struct SelectIconView: View {
    //MARK: - PROPERTIES
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                ForEach(icons, id:\.self) {icon in
                    IconGridItemView(icon: icon)
                }
            }//: grid
            .padding(10)
            .animation(.easeInOut(duration: 1.0))
        }
        .onAppear(perform: {
            gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        })
//        .frame(width: 100, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}


//MARK: - PREVIEW
struct SelectIconView_Previews: PreviewProvider {
    static var previews: some View {
        SelectIconView()
    }
}
