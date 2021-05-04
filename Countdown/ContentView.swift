//
//  ContentView.swift
//  Countdown
//
//  Created by cnwang on 2021/4/29.
//

import SwiftUI
import Foundation
import WidgetKit
struct ContentView: View {
    

    @State var isSettingViewShow: Bool = false

    @StateObject var countdownVM: CountdownViewModel = CountdownViewModel()
    var body: some View {
        NavigationView {
            VStack{
                Image("tesla")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 240, alignment: .center)
                
                Text(countdownVM.title)
                    .font(.title)
                    .padding()

                CountdownProgressView(countdownVM: countdownVM)

                Spacer()
                    DateDetailView(countdownVM: countdownVM)
                    .navigationTitle("Countdown")
                    .navigationBarItems(trailing: Button(action: {
                        isSettingViewShow.toggle()
                    }, label: {
                        Image(systemName: "info")
                    }))
                    
                
            }
            .sheet(isPresented: $isSettingViewShow, onDismiss: {
                WidgetCenter.shared.reloadAllTimelines()
            }, content: {
                SetDateView(countdownVM: countdownVM)
            })
            .padding()
            .onAppear(
                
                
        )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
