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
                Image("tesla-400")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 240, alignment: .center)
                
                Text(countdownVM.title)
                    .font(.title)
                    .padding()
                
                CountdownProgressView(countdownVM: countdownVM)
                
                Spacer()
                DateDetailView(countdownVM: countdownVM)
                
                
            }
            
            .padding()
            
            .toolbar(content: {
                ToolbarItem(placement: .principal, content: {
                                Text("Countdown")
                })
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        isSettingViewShow.toggle()
                    }, label: {
                        Image(systemName: "gear")
                    })
                })
                
            })
            .navigationViewStyle(StackNavigationViewStyle())
            .sheet(isPresented: $isSettingViewShow, onDismiss: {
                WidgetCenter.shared.reloadAllTimelines()
            }, content: {
                SetDateView(countdownVM: countdownVM)
            })
        }//: NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
