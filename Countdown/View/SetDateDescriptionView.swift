//
//  SetDateDescriptionView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/8.
//

import SwiftUI

struct SetDateDescriptionView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        
        GeometryReader{ geometry in
            GroupBox(label: Text("Description")){
                
                Image("timeline")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.6 , height: 100, alignment: .center)

                Text("FROM set, TO set --> shows percentage")
                Text("FROM not set, TO set --> shows left days")
                Text("FROM set, TO not set --> shows elapsed days")
            }
            .font(.subheadline)
            .padding(.horizontal, 2)
        }
        
    }
}


//MARK: - PREVIEW
struct SetDateDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SetDateDescriptionView()
            .previewLayout(.sizeThatFits)
    }
}
