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
                .fill(Color.gray.opacity(0.7))
            //                .zIndex(0)
            VStack {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    //                    .foregroundColor(.black)
                    .foregroundColor(.accentColor)
                    .padding(.vertical,30)
//
                TextField("textEntered", text: $textEntered)
                    .font(.title).zIndex(99)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(5)
                    .foregroundColor(Color.accentColor)
                                    .background(Color.gray.opacity(0.2))
                                    .padding(.horizontal, 20)
                
                                Divider()
//                Spacer()

                HStack {
                    Button(action: {showingAlert.toggle()}
                           , label: {
                            Text("OK")
                                .font(.title)
                           })


                }
                .zIndex(0)
                .padding()
                .padding(.horizontal, 40)
            } //:VSTACK
            
          
        }//:ZStack
        
        .frame(width: 320, height: 200)
//        .shadow(radius: 5)
    }
}



//MARK: - PREVIEW
struct PopupTextView_Previews: PreviewProvider {

    @State var isShowing:Bool = true
    @State var title: String = ""
    static var previews: some View {
        
        
        GroupBox {
            PopupTextView(title: "Enter Subject", textEntered: .constant("Dreams come true"), showingAlert: .constant(true))
                .previewLayout(.sizeThatFits)
            
            
            PopupTextView(title: "Enter Subject", textEntered: .constant("Dreams come true"), showingAlert: .constant(true))
                .previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .dark)
            
        }
    }

}
