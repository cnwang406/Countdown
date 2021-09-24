//
//  OnBoardScreen.swift
//  Countdown
//
//  Created by cnwang on 2021/5/26.
//

import SwiftUI

struct OnBoardScreen: View {
    //MARK: - PROPERTIES
    @State var onBoardScreenShowed: Bool = UserDefaults(suiteName: "group.com.cnwang")?.onBoardScreenShow ?? true
    @Environment(\.presentationMode) var presentationMode
    
    //MARK: - BODY
    var body: some View {
        VStack{
            HStack(alignment:.bottom){
                Text("WELCOME")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Ver.\(UIApplication.appVersion!)b\(UIApplication.appBuildVersion!)")
                    .font(.subheadline)
                    .opacity(0.8)
                    
            }
        OnBoardCellView()
            .padding(.vertical,10)
            GeometryReader{geometry in
                Image("onBoardScreen tips")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 10)
                    .rotationEffect(Angle(degrees: -5.0))

            }
            .padding()
        Spacer()
            Toggle("Don't show this hint next time", isOn: $onBoardScreenShowed)
                .font(.title3)
                .opacity(0.8)
                
            Button(action: {
                UserDefaults(suiteName: "group.com.cnwang")?.setValue(onBoardScreenShowed, forKey: "onBoardScreenShow")
                presentationMode.wrappedValue.dismiss()

            }, label: {
                Text("Start to use")
                    .font(.title)
            })
        }.padding()
    }
}


//MARK: - PREVIEW
struct OnBoardScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardScreen()
    }
}



