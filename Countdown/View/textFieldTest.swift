//
//  textFieldTest.swift
//  Countdown
//
//  Created by cnwang on 2021/6/1.
//

import SwiftUI

struct textFieldTest: View {
    //MARK: - PROPERTIES
    @Binding var ttt: String
    var title = "XXX"
    //MARK: - BODY
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray)
            VStack {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    //                    .foregroundColor(.black)
                    .foregroundColor(.accentColor)
                    .padding(.vertical,30)
            TextField(ttt, text: $ttt)
            }
        }
        .shadow(radius: 15)
//        .frame(width: 320, height: 200)
    }
}


//MARK: - PREVIEW
struct textFieldTest_Previews: PreviewProvider {
    static var previews: some View {
        textFieldTest(ttt: .constant("AAA"))
    }
}
