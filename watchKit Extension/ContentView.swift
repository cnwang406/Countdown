//
//  ContentView.swift
//  watchKit Extension
//
//  Created by cnwang on 2021/7/1.
//

import SwiftUI

struct ContentView: View {
    @StateObject var countdownVM = CountdownViewModel()
    
    
    var body: some View {
        Text(countdownVM.leftUnit)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
