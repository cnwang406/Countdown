//
//  AboutRowView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/8.
//

import SwiftUI

struct AboutRowView: View {
    //MARK: - PROPERTIES
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    //MARK: - BODY
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack{
                Text(name).foregroundColor(Color.gray)
                Spacer()
                if (content != nil) {
                    Text(content!)
                } else if (linkLabel != nil && linkDestination != nil) {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)" )!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(Color.pink)
                } else {
                     EmptyView()
                        
                }
            }
        }
    }
}


//MARK: - PREVIEW
struct AboutRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AboutRowView(name: "Developer", content: "cnwang")
    //        SettingRowView(name: "Developer")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            AboutRowView(name: "Developer", linkLabel: "cnwang learning", linkDestination: "www.google.com")
                .preferredColorScheme(.dark)
                //        SettingRowView(name: "Developer")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
