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
                .fill(Color.gray)
            VStack {
                Text(title)
                    .font(.title)
                    .foregroundColor(.black)
                
                Spacer()
                TextField(textEntered, text: $textEntered)
                    .padding(5)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .background(Color.gray.opacity(0.2))
                    .foregroundColor(Color.accentColor)
                    .padding(.horizontal, 20)
                
//                Divider()
                Spacer()
                
                HStack {
                    Button(action: {showingAlert.toggle()}
                           , label: {
                        Text("OK")
                            .font(.title)
                    })
                    
                    
                }
                .padding(30)
                .padding(.horizontal, 40)
            }
        }
        
        .frame(width: 320, height: 200)
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
