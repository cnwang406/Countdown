//
//  IconGridItemView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/7.
//

import SwiftUI

struct IconGridItemView: View {
    //MARK: - PROPERTIES
    let icon: String
    //MARK: - BODY
    var body: some View {
        Image(icon)
            .resizable()
            .scaledToFit()
            .frame(width: 24)
    }
}


//MARK: - PREVIEW
struct IconGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        IconGridItemView(icon: icons[0])
    }
}
