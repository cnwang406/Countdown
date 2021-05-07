//
//  ContentView.swift
//  Countdown
//
//  Created by cnwang on 2021/4/29.
//

import SwiftUI
import Foundation
import WidgetKit
struct MainView: View {
    
    
    @State var isSettingViewShow: Bool = false
    
    @StateObject var countdownVM: CountdownViewModel = CountdownViewModel()
    var body: some View {
        NavigationView {
            VStack{
                Image("tesla.white")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 240, alignment: .center)
                
                Text(countdownVM.title)
                    .font(.title)
                    .padding()
                
                CountdownProgressView(countdownVM: countdownVM)
                
                Spacer()
                DateDetailView(countdownVM: countdownVM)
                Spacer()
                
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
