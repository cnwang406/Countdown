//
//  PopupTextView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/9.
//

import SwiftUI

struct PopupTextView: View {
    //MARK: - PROPERTIES
    var title: String
    @Binding var textEntered: String
    @Binding var showingAlert: Bool
    //MARK: - BODY
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
            VStack {
                Text(title)
                    .font(.title)
                    .foregroundColor(.black)
                
                Divider()
                
                TextField(textEntered, text: $textEntered)
                    .cornerRadius(5)
                    .padding(5)
                    .background(Color.gray.opacity(0.2))
                    .foregroundColor(.black)
                    .padding(.horizontal, 20)
                
                Divider()
                
                HStack {
                    Button("OK") {
                        self.showingAlert.toggle()
                    }
                }
                .padding(30)
                .padding(.horizontal, 40)
            }
        }
        .frame(width: 300, height: 200)
    }
}



//MARK: - PREVIEW
//struct PopupTextView_Previews: PreviewProvider {
//   @State var title: String = ""
//    @State var isShowing:Bool = true
//    static var previews: some View {
//        PopupTextView(textEntered: $title, showingAlert: .constant(true))
//    }
//}
