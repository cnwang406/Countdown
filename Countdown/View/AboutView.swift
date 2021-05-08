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
    //MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                GroupBox(
                    label: AboutLevelView(labelText: "Application", labelImage: "applescript")
                ){
                    
                    AboutRowView(name: "Version", content: "Ver.\(UIApplication.appVersion!) build \(UIApplication.appBuildVersion!)")
                    //                            AboutRowView(name:"Developer", content: "cnwang")
                    AboutRowView(name:"Designer",content:"cnwang")
                    AboutRowView(name:"Compability", content: "IOS14")
                    AboutRowView(name:"twitter", linkLabel:"@cnwang406", linkDestination: "twitter.com/cnwang406")
                    AboutRowView(name:"SWIFTUI", content: "2.0")
                    AboutRowView(name:"all icons from", linkLabel:"8icons", linkDestination: "icons8.com")
                    AboutRowView(name:"WHY?", content: "This app is for counting the days remains for my Tesla M3 coming")
                    
                } //:GROUPBOX
                .padding()
                Spacer()
                Button(action: {
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
