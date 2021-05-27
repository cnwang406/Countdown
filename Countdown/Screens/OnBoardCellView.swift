//
//  OnBoardCellView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/26.
//

import SwiftUI

struct OnBoardCellView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        HStack{
            
        Image("LeftDays Widget")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150, alignment: .center)
            .shadow(radius: 10)
            
        Text("Put a widget on home screen")
            .font(.title3)
        }
    }
}


//MARK: - PREVIEW
struct OnBoardCellView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardCellView()
            .previewLayout(.sizeThatFits)
    }
}
