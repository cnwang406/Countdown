//
//  OnBoardScreen.swift
//  Countdown
//
//  Created by cnwang on 2021/5/26.
//

import SwiftUI

struct OnBoardScreen: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        VStack{
        Text("WELCOME")
            .font(.title)
            .fontWeight(.bold)
        Spacer()
            Button(action: {}, label: {
                Text("Start to use")
                    .font(.title)
            })
        }
    }
}


//MARK: - PREVIEW
struct OnBoardScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardScreen()
    }
}



