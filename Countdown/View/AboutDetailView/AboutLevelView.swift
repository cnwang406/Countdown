//
//  AboutLevelView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/8.
//

import SwiftUI

struct AboutLevelView: View {
    
    //MARK - PROPERTIES
    var labelText: String
    var labelImage : String
    //MARK - BODY
    var body: some View {
        HStack {
            Text(labelText.uppercased()).fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
            
        }
    }
}


//MARK: - PREVIEW
struct AboutLevelView_Previews: PreviewProvider {
    static var previews: some View {
        AboutLevelView(labelText: "Fructus", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
