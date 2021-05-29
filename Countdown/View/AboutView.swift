//
//  AboutView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/8.
//

import SwiftUI


struct AboutView: View {
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @State var onBoardScreenShowed: Bool = UserDefaults(suiteName: "group.com.cnwang")?.onBoardScreenShow ?? true
    //MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                GroupBox(
                    label: AboutLevelView(labelText: "Application", labelImage: "")
                ){
                    
                    AboutRowView(name: "Version", content: "Ver.\(UIApplication.appVersion!) build \(UIApplication.appBuildVersion!)")
                    //                            AboutRowView(name:"Developer", content: "cnwang")
                    AboutRowView(name:"Designer",content:"cnwang")
                    AboutRowView(name:"Compability", content: "IOS14")
                    AboutRowView(name:"twitter", linkLabel:"@cnwang406", linkDestination: "twitter.com/cnwang406")
                    AboutRowView(name:"SWIFTUI", content: "2.0")
                    AboutRowView(name:"all icons from", linkLabel:"8icons.com", linkDestination: "icons8.com")
                    AboutRowView(name:"WHY?", content: "This app is for counting the days remains for my Tesla M3 coming")
                    
                } //:GROUPBOX
                .padding()
                Spacer()
                Toggle("Show tips at startup next time",isOn: $onBoardScreenShowed)
                    .font(.title3)
                    .opacity(0.8)
                    .padding()
                Button(action: {
                    UserDefaults(suiteName: "group.com.cnwang")?.setValue(onBoardScreenShowed, forKey: "onBoardScreenShow")
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Close")
                        .font(.title)
                })
                
            }//:VSTack
            .toolbar(content: {
                ToolbarItem(placement: .principal, content: {
                    Text("About")
                        .font(.title)
                        .fontWeight(.bold)
                })
            })
        }//:NavView
        
    }
}


//MARK: - PREVIEW
struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
